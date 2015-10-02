//
//  pickerexampleic.swift
//  hmwk8
//
//  Created by Nicholas Largen on 9/30/15.
//  Copyright © 2015 Nicholas Largen. All rights reserved.
//

import WatchKit
import Foundation


class pickerexampleic: WKInterfaceController {
    var currSelectedIndex = 0
   let alert = WKAlertAction(title: "ok", style: WKAlertActionStyle.Cancel, handler: {() -> Void in})
    let sides = [4,6,8,10,12,20,100]
    @IBOutlet var pickerout: WKInterfacePicker!
    
    @IBAction func whichonebuttonpressed()
    {
        
         self.presentAlertControllerWithTitle("The Roll", message: "\(rand()%Int32(self.sides[currSelectedIndex]) + 1)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    @IBAction func onclick(value: Int)
    {
        self.currSelectedIndex = value
        
    }
    override func awakeWithContext(context: AnyObject?)
    {
        
        super.awakeWithContext(context)
        var thePickerItems = [WKPickerItem]()
        let tablevals = ["D4","D6","D8","D10","D12","D20","D100"]
        let theimages = ["d4.jpeg","d6.jpeg","d8.jpeg", "d10.jpeg","d12.jpeg","d20.jpg","d100.jpeg"]
        for (var i = 0 ; i < tablevals.count; i++)
        {
        thePickerItems.append(WKPickerItem())
        thePickerItems[i].title =  tablevals[i]
        thePickerItems[i].caption = tablevals[i]
        thePickerItems[i].contentImage = WKImage(imageName:theimages[i])
        }
        self.pickerout.setItems(thePickerItems)
        
        // Configure interface objects here.
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
