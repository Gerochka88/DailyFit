import UIKit

class ActivityMonitorViewController: UIViewController {
    
    @IBOutlet weak var bestScoreView: BestScoreView!
    @IBOutlet weak var totalStepsView: TotalOfStepsView!
    @IBOutlet weak var runningLevelView: RunningLevelView!
    @IBOutlet weak var dailySummaryView: DailySummaryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        runningLevelView.completionCallback = {
            self.play(withDelay: 0.5)
        }
        play(withDelay: 1)
    }
    
    private func play(withDelay: TimeInterval) {
        self.perform(#selector(animateViews), with: .none, afterDelay: withDelay)
    }
    
    @objc func animateViews() {
        bestScoreView.play()
        totalStepsView.play()
        runningLevelView.play()
        dailySummaryView.play()
    }
    
}
