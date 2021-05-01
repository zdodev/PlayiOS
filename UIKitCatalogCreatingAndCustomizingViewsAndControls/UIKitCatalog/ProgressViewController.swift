/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that demonstrates how to use `UIProgressView`.
*/

import UIKit

class ProgressViewController: UITableViewController {
    // MARK: - Properties
    
    @IBOutlet weak var defaultStyleProgressView: UIProgressView!
    
    @IBOutlet weak var barStyleProgressView: UIProgressView!
    
    @IBOutlet weak var tintedProgressView: UIProgressView!

    @IBOutlet var progressViews: [UIProgressView]!
    
	var observer: NSKeyValueObservation?
	
	/**	An `NSProgress` object who's `fractionCompleted` is observed using KVO to update
		the `UIProgressView`s' `progress` properties.
    */
	let progress = Progress(totalUnitCount: 10)
    
    // A repeating timer that, when fired, updates the `NSProgress` object's `completedUnitCount` property.
	var updateTimer: Timer?
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
		
        // Register as an observer of the `NSProgress`'s `fractionCompleted` property.
		observer = progress.observe(\.fractionCompleted, options: [.new]) { (_, _) in
			// Update the progress views.
			for progressView in self.progressViews {
				progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
			}
		}
    }
    
    deinit {
        // Unregister as an observer of the `NSProgress`'s `fractionCompleted` property.
		observer?.invalidate()
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDefaultStyleProgressView()
        configureBarStyleProgressView()
        configureTintedProgressView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Reset the completed progress of the `UIProgressView`s.
        for progressView in progressViews {
            progressView.setProgress(0.0, animated: false)
        }
        
        /** Reset the `completedUnitCount` of the `NSProgress` object and create
            a repeating timer to increment it over time.
        */
        progress.completedUnitCount = 0

		updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
			/** Update the `completedUnitCount` of the `NSProgress` object if it's
				not completed. Otherwise, stop the timer.
			*/
			if self.progress.completedUnitCount < self.progress.totalUnitCount {
				self.progress.completedUnitCount += 1
			} else {
				self.updateTimer?.invalidate()
			}
		})
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Stop the timer from firing.
        updateTimer?.invalidate()
    }
	
    // MARK: - Configuration

    func configureDefaultStyleProgressView() {
        defaultStyleProgressView.progressViewStyle = .default
    }

    func configureBarStyleProgressView() {
        barStyleProgressView.progressViewStyle = .bar
    }

    func configureTintedProgressView() {
        tintedProgressView.progressViewStyle = .default

        tintedProgressView.trackTintColor = UIColor.systemBlue
        tintedProgressView.progressTintColor = UIColor.systemPurple
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        #if targetEnvironment(macCatalyst)
        // Don't show tinted progress view for macOS, it does not exist.
        if section == 2 {
            return ""
        } else {
            return super.tableView(tableView, titleForHeaderInSection: section)
        }
        #else
        return super.tableView(tableView, titleForHeaderInSection: section)
        #endif
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        #if targetEnvironment(macCatalyst)
        // Don't show tinted progress view for macOS, it does not exist.
        if indexPath.section == 2 {
            return 0
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        #else
        return super.tableView(tableView, heightForRowAt: indexPath)
        #endif
    }
    
}
