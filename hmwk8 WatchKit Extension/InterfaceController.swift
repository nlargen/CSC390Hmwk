//
//  InterfaceController.swift
//  hmwk8 WatchKit Extension
//
//  Created by Nicholas Largen on 9/30/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var thetable1: WKInterfaceTable!
    let alert = WKAlertAction(title: "ok", style: WKAlertActionStyle.Cancel, handler: {() -> Void in})
    let sides = [4,6,8,10,12,20,100]
    let theimages = ["d4.jpeg","d6.jpeg","d8.jpeg", "d10.jpeg","d12.jpeg","d20.jpg","d100.jpeg"]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        

         let tablevals = ["D4","D6","D8","D10","D12","D20","D100"]
        self.thetable1.setNumberOfRows(tablevals.count, withRowType: "cell")
        for(var i = 0; i < tablevals.count; i++)
        {
            let currRow = self.thetable1.rowControllerAtIndex(i) as! tablecell
            currRow.dicelabel.setText( tablevals[i] )
            
        currRow.diceimage.setImageNamed(theimages[i])
            
        }
        

        // Configure interface objects here.
    }
   override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int)
    {
       self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%Int32(self.sides[rowIndex]) + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
        
        
    }
    

    override func willActivate() {
               // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
