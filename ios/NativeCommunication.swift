import Foundation
import WebKit

struct NativeEvents {
    struct EventNames {
        static let ONCLOSE = "onclose"
    }
}

@objc(NativeCommunication)
public class NativeCommunication: UIViewController, WKNavigationDelegate {
  
  @objc public func getDataFromRN(_ value: String?) {
  print("value from RN===",value as Any)
    DemoEmitterManager1.sendDataToRN(demoValue: value!);
  }
  
   @objc public func sendHTMLPath(_ htmlpath: String?) {
    print("htmlpath from RN===",htmlpath as Any)
     
    // This is Native UIDocumentMenuViewController open
    DispatchQueue.main.async {
        let documentProviderMenu: UIDocumentMenuViewController = UIDocumentMenuViewController(documentTypes: ["public.data"], in: .import)
        documentProviderMenu.modalPresentationStyle = .formSheet
        documentProviderMenu.popoverPresentationController?.sourceView = self.view
        documentProviderMenu.popoverPresentationController?.sourceRect = self.view.bounds
        documentProviderMenu.delegate = self
        let appDelegate = UIApplication.shared.delegate
        let controller = appDelegate?.window??.rootViewController
        controller!.present(documentProviderMenu, animated: true, completion: nil)
    }
    
    // This is logic to get the file path from iOS File manager and load in to WKWebview.
    let fromRNFilePathStr: String = htmlpath!
    var replacedPath: String = "";
    let fileManager = FileManager.default
    if let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        print("directory path:", documentsURL.path)
     let initialFilePath = documentsURL.path
      replacedPath = initialFilePath.replacingOccurrences(of: "/Documents", with: fromRNFilePathStr)
     print("replaced path:", replacedPath)
    }
    let finalURL = URL(string:"file://" + replacedPath)
    print("finalURL ===", finalURL!)
          DispatchQueue.main.async { [weak self] in
            let appDelegate = UIApplication.shared.delegate
            let controller = appDelegate?.window??.rootViewController
            let webview = WKWebView()
            webview.frame  = CGRect(x: 0, y: 250, width: UIScreen.main.bounds.width, height: 500)
            webview.loadFileURL(finalURL!, allowingReadAccessTo: finalURL!)
            webview.load(URLRequest(url: finalURL!))
            webview.allowsBackForwardNavigationGestures = true
            controller?.view.addSubview(webview)
      }
   }
}

// This extension required for Native UIDocumentPicker access
extension NativeCommunication: UIDocumentMenuDelegate, UIDocumentPickerDelegate {

  public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {

        if controller.documentPickerMode == .import {

            let coordintor: NSFileCoordinator = NSFileCoordinator(filePresenter: nil)

            coordintor.coordinate(readingItemAt: url, options: .forUploading, error: nil, byAccessor: { [weak self] newURL in
                print("newURL Test ===: \(newURL)")
              // Create file URL to temporary folder
              var tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
              // Apend filename (name+extension) to URL
              tempURL.appendPathComponent(url.lastPathComponent)
              do {
                  // If file with same name exists remove it (replace file with new one)
                  if FileManager.default.fileExists(atPath: tempURL.path) {
                      try FileManager.default.removeItem(atPath: tempURL.path)
                  }
                  // Move file from app_id-Inbox to tmp/filename
                  try FileManager.default.moveItem(atPath: url.path, toPath: tempURL.path)
                
                print("tempURL file path ===",tempURL)
                 DispatchQueue.main.async { [weak self] in
                   let appDelegate = UIApplication.shared.delegate
                   let controller = appDelegate?.window??.rootViewController
                   let webview = WKWebView()
                  webview.frame  = CGRect(x: 0, y: 250, width: UIScreen.main.bounds.width, height: 500)
                  webview.loadFileURL(tempURL, allowingReadAccessTo: tempURL)
                  webview.load(URLRequest(url: tempURL))
                  webview.allowsBackForwardNavigationGestures = true
                  controller?.view.addSubview(webview)
                }
                
              } catch {
                  print(error.localizedDescription)
              }
              
          })

        }

    }

  public func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {

          documentPicker.delegate = self

           let appDelegate = UIApplication.shared.delegate
           let controller = appDelegate?.window??.rootViewController
          controller!.present(documentPicker, animated: true, completion: nil)

    }

}

extension FileManager {

    func getFilesDirectory() -> URL {

        let paths = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.testapp.com")

        let filesDirectoryURL = paths!.appendingPathComponent("Files", isDirectory: true)
        var isDir : ObjCBool = true
        // IF files directory does not exist, create manually
        if FileManager.default.fileExists(atPath: filesDirectoryURL.path, isDirectory: &isDir) == false {
            do {
                try FileManager.default.createDirectory(at: filesDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error in adding files folder")
            }
        }
        return filesDirectoryURL
    }

}
