#  AutoLayout Event Cycle

## Q1. When did auto layout finish calculating in UIViewController?
### 1. `viewWillLayoutSubviews()` : will execute before Auto Layout System starts
### 2. `viewDidLayoutSubviews()` : After Auto Layout System finishes calculation. 
        - Auto layout system finish calculating doesn't mean the subviews underneath this view is also finish with their calculations, they have their own layout cycle
        - This method will be executed many times (each time the view needs an update)
        - This method is executed before the view appears infront of the user, so user can't see your changes in this method.
### 3. `viewDidAppear()` : After Auto Layout System finishes calculation and view appears. 
        - This method will only be executed when view first appear (switch scenes). 
        - This method is executed after the view appears infront of the user, so user might see your changes in this method.

## Q2. When did auto layout finish calculating in UIView?
### 1. `layoutSubviews` : executed after Auto Layout System finish arranging the Subviews under the Receiver of this Method, then we can get the calculated Frame of the SubViews.
        - Each View's subview has their own Layout Cycle, so their final frame can only be get under `layoutSubviews`
### 2. `layoutIfNeeded()` : Force the Auto Layout System to immediately update the Frame of the SubViews under the Receiver according to the Constraints.
### 3. `setNeedsLayout()` : Invalid existing Constraints, and update the screen with new Constraints in the next Layout Cycle.

 ## Q3. Auto Layout calculate sequence
 ### In this app
 - `yellowCircle` is added to view hierarchy
 - `yellowCircle` autoLayout finishes calculation
 - the view controller finishes autolayout calculation
 - `purpleCircle` and `redCircle` are added to view hierarchy
 - `purpleCircle` and `redCircle` autoLayout finishes calculation

