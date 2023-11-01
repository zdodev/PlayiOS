import BackgroundTasks

final class AppBackgroundTaskService {
    private let backgroundTaskIdentifier = "bgtask.refresh"
    
    func startBackgroundTask() {
        BGTaskScheduler.shared.register(
            forTaskWithIdentifier: backgroundTaskIdentifier,
            using: nil
        ) { [weak self] task in
            if let appRefreshTask = task as? BGAppRefreshTask {
                self?.backgroundTask(task: appRefreshTask)
            }
        }
    }
    
    func scheduleBackgroundTask() {
        let request = BGAppRefreshTaskRequest(identifier: backgroundTaskIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1)
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print("catch")
        } catch {
            print("fail \(error.localizedDescription)")
        }
    }
    
    private func backgroundTask(task: BGAppRefreshTask) {
        scheduleBackgroundTask()
        
        print("do task")
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        task.setTaskCompleted(success: true)
    }
}
