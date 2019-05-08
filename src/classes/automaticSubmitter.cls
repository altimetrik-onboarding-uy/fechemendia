global class automaticSubmitter implements Schedulable {
    global void execute(SchedulableContext ctx) {
        timesheetBatchSubmitter batch = new timesheetBatchSubmitter();
        Id batchId = Database.executeBatch(batch);
    }
}