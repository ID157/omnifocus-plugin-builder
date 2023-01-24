import format from 'date-fns/format'

(() => {
	const action = new PlugIn.Action((selection: Selection) => {
    const tasks = selection.tasks
    const now = new Date()
    tasks.forEach((task: Task) => task.appendStringToNote(`#start{${format(now, 'HH:mm')}}`))
  })

	action.validate = function(selection: Selection){
    return selection.tasks.length >= 1
	};
	return action;
})();
