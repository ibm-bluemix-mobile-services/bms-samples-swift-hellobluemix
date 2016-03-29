/*
* Copyright 2016 IBM Corp.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* http://www.apache.org/licenses/LICENSE-2.0
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import UIKit
import BMSCore
import BMSAnalyticsSpec

class ViewController: UIViewController {

	@IBOutlet weak var pingButton: UIButton!
	@IBOutlet weak var topLabel: UILabel!
	@IBOutlet weak var bottomLabel: UILabel!
	@IBOutlet weak var errorTextView: UITextView!

	let logger = Logger.loggerForName("ViewController")

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	@IBAction func testBluemixConnection(sender: AnyObject) {
		self.pingButton.backgroundColor = UIColor (red:0.0/255.0, green:174.0/255.0, blue:211.0/255.0, alpha:1)
		
		let request = Request(url: "/", method: HttpMethod.GET)
		
		request.sendWithCompletionHandler { (response, error) -> Void in
			if let error = error{
				self.logger.error(error.description)
				dispatch_async(dispatch_get_main_queue(), {
					self.topLabel.text = "Bummer"
					self.bottomLabel.text = "Something Went Wrong"
					if (!error.localizedDescription.isEmpty){
						let errorMsg =  error.localizedDescription + " Please verify the ApplicationRoute and ApplicationID"
						self.errorTextView.text = errorMsg
					} else{
						self.errorTextView.text = "Please verify the ApplicationRoute and ApplicationID"
					}
				})
			} else {
				self.logger.info("You have connected to Bluemix successfully")
				dispatch_async(dispatch_get_main_queue(), {
					self.topLabel.text = "Yay!"
					self.bottomLabel.text = "You Are Connected"
					self.errorTextView.text = ""
					self.pingButton.backgroundColor = UIColor (red:28.0/255.0, green:178.0/255.0, blue:153.0/255.0, alpha:1)
				})
			}
			self.pingButton.backgroundColor = UIColor (red:28.0/255.0, green:178.0/255.0, blue:153.0/255.0, alpha:1)
		}
	}

}

