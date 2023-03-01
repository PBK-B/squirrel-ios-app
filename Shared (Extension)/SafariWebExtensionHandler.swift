//
//  SafariWebExtensionHandler.swift
//  Shared (Extension)
//
//  Created by Bin on 2023/3/1.
//

import os.log
import SafariServices

let SFExtensionMessageKey = "message"

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)

        let response = NSExtensionItem()
        response.userInfo = [SFExtensionMessageKey: ["Response to": message]]

        context.completeRequest(returningItems: [response], completionHandler: nil)

        startLocalServer()
    }

    func startLocalServer() {
        NSLog("tzmax: 开始启动本地服务器")
    }
}