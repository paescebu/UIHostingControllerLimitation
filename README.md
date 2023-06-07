# UIHostingControllerLimitation
Showcases a limitation of animated size changes of SwiftUI Views when interoperating with UIKit


A small showcase of the mentioned problem from: https://twitter.com/paescebu/status/1665854572995256325?s=20

**Problem Statement*

The built application shows a conflicting problem:
It feels like you can either:
- Have a UIHostingController intrinsicly sizing according to the SwiftUI View changes, without animations
(see use with: `ExpandingView`)
- Have animated size changes, but the UIHostingControllers constraints (top right, won't work during a transition)
(see use with: `ExpandingViewAnimated`)
- Have both above, but content below the button (z-axis), would be blocked as the SwiftUI View is fixed in height for a stable animation
(see use with: `ExpandingViewExpectedAnimation`)
