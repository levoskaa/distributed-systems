package hu.bme.aut.statechartdsl.validation

import org.eclipse.xtext.validation.Check
import hu.bme.aut.statechartdsl.statechartDSL.StatechartDSLPackage

class StatechartDSLValidator extends AbstractStatechartDSLValidator {
	static val INVALID_EXIT_ACTION_COUNT= 'InvalidExitActionCount'
	
	@Check
	def checkStateExitActionCount(hu.bme.aut.statechartdsl.statechartDSL.State state) {
		var exitActions = state.exitActions.size
		for (transition : state.transitions) {
			exitActions += transition.actions.size
		}
		if (exitActions > 5) {
			error("States cannot have more than 5 exit actions.",
				StatechartDSLPackage.Literals.STATE__NAME,
				INVALID_EXIT_ACTION_COUNT
			)
		}
	}
}