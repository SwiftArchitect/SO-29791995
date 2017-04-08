# Pull To Refresh in `UIScrollView`

![iOS 10.2](https://i.stack.imgur.com/xjfgE.gif)

[↻ replay animation](https://i.stack.imgur.com/xjfgE.gif)

---

### Stack Overflow Question 29791995

Xcode project & source code related to [Swift + iOS 10](http://stackoverflow.com/a/43288926/218152) answer.

In a nutshell, `UIRefreshControl` is not exactly supported in pre-iOS 10 versions. You can still create an approached experience, but you will notice that scrolling from top (pull to refresh) drifts noticeably, making it unpractical in certain situations.

The present project offers an iOS agnostic solution, which will do its best to take advantage of all the available OS support.

![iOS 9.0](https://i.stack.imgur.com/JbGRI.gif)

[↻ replay animation](https://i.stack.imgur.com/JbGRI.gif)

---

**Instructions:**

1. Build for various OS versions (8- & 9) and modern (10+), run
2. Pull to refresh

**References:**

- [SO-29791995](http://stackoverflow.com/questions/29791995/swift-pull-to-refresh) on Stack Overflow
- This and other answers posted on [Swift Recipes](http://swiftarchitect.com/recipes/)

