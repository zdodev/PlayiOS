/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view controller that demonstrates how to use `UISwitch`.
*/

import UIKit

class SwitchViewController: UITableViewController {
    // MARK: - Properties

    @IBOutlet weak var defaultSwitch: UISwitch!
    @IBOutlet weak var checkBoxSwitch: UISwitch!
    @IBOutlet weak var tintedSwitch: UISwitch!

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDefaultSwitch()
        configureCheckboxSwitch() // macOS only.
        configureTintedSwitch() // iOS only.
    }

    // MARK: - Configuration
    
    func configureDefaultSwitch() {
        defaultSwitch.setOn(true, animated: false)
        defaultSwitch.preferredStyle = .sliding
        
        defaultSwitch.addTarget(self, action: #selector(SwitchViewController.switchValueDidChange(_:)), for: .valueChanged)
    }
    
    func configureCheckboxSwitch() {
        checkBoxSwitch.setOn(true, animated: false)

        checkBoxSwitch.addTarget(self, action: #selector(SwitchViewController.switchValueDidChange(_:)), for: .valueChanged)
        
        // On the Mac, make sure this control take on the apperance of a checkbox with a title.
        if traitCollection.userInterfaceIdiom == .mac {
            checkBoxSwitch.preferredStyle = .checkbox
            
            // Title on a UISwitch is only supported when running Catalyst apps in the Mac Idiom.
            checkBoxSwitch.title = NSLocalizedString("SwitchTitle", comment: "")
        }
    }

    func configureTintedSwitch() {
        tintedSwitch.tintColor = UIColor.systemBlue
        tintedSwitch.onTintColor = UIColor.systemGreen
        tintedSwitch.thumbTintColor = UIColor.systemPurple

        tintedSwitch.addTarget(self, action: #selector(SwitchViewController.switchValueDidChange(_:)), for: .valueChanged)
        
        // Note that on the Mac, tinted switches are not possible, so we hide the tinted one.
        if traitCollection.userInterfaceIdiom == .mac {
            tintedSwitch.isHidden = true
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        #if targetEnvironment(macCatalyst)
        // Don't show tinted switch control for macOS, it does not exist.
        if section == 2 {
            return ""
        } else {
            return super.tableView(tableView, titleForHeaderInSection: section)
        }
        #else
        // Don't show checkbox switch control for iOS, it does not exist.
        if section == 1 {
            return ""
        } else {
            return super.tableView(tableView, titleForHeaderInSection: section)
        }
        #endif
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        #if targetEnvironment(macCatalyst)
        // Don't show tinted switch control for macOS, it does not exist.
        if indexPath.section == 2 {
            return 0
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        #else
        // Don't show checkbox switch control for iOS, it does not exist.
        if indexPath.section == 1 {
            return 0
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
        #endif
    }

    // MARK: - Actions

    @objc
    func switchValueDidChange(_ aSwitch: UISwitch) {
        print("A switch changed its value: \(aSwitch).")
    }
}
