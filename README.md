# SuspendViewDemo
模拟微信和IOS系统辅助功能悬浮窗的功能

Imitate suspend window like WeChat and assistive touch in IOS


# How to use it
1. Put three files, "UIViewController+FF.swift", "SuspendTool.swift" and "SuspendWindow.swift" to your project.
2. Add following code to the controller which need to be suspended.
```
self.suspend(coverImageName: imageName, type: suspendType)
```
3. SuspendType include threee types, single, multi and none. 
   Type single means there will be only one suspend window.
   Type multi means there will be several suspend windows.
   Type none means to cancel the suspend window.

# Demonstration
1. SuspendType: single
![单悬浮窗模式](/QQ20180725-154436-HD.gif)

2. SuspendType: multi
![多悬浮窗模式](/QQ20180725-154535-HD.gif)

![悬浮窗拖动](/QQ20180725-154701-HD.gif)
