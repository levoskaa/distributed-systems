/*
 * generated by Xtext 2.25.0
 */
grammar InternalStatechartDSL;

options {
	superClass=AbstractInternalAntlrParser;
}

@lexer::header {
package hu.bme.aut.statechartdsl.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package hu.bme.aut.statechartdsl.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import hu.bme.aut.statechartdsl.services.StatechartDSLGrammarAccess;

}

@parser::members {

 	private StatechartDSLGrammarAccess grammarAccess;

    public InternalStatechartDSLParser(TokenStream input, StatechartDSLGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }

    @Override
    protected String getFirstRuleName() {
    	return "StatechartModel";
   	}

   	@Override
   	protected StatechartDSLGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}

}

@rulecatch {
    catch (RecognitionException re) {
        recover(input,re);
        appendSkippedTokens();
    }
}

// Entry rule entryRuleStatechartModel
entryRuleStatechartModel returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getStatechartModelRule()); }
	iv_ruleStatechartModel=ruleStatechartModel
	{ $current=$iv_ruleStatechartModel.current; }
	EOF;

// Rule StatechartModel
ruleStatechartModel returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		(
			{
				newCompositeNode(grammarAccess.getStatechartModelAccess().getStatesStateParserRuleCall_0());
			}
			lv_states_0_0=ruleState
			{
				if ($current==null) {
					$current = createModelElementForParent(grammarAccess.getStatechartModelRule());
				}
				add(
					$current,
					"states",
					lv_states_0_0,
					"hu.bme.aut.statechartdsl.StatechartDSL.State");
				afterParserOrEnumRuleCall();
			}
		)
	)*
;

// Entry rule entryRuleState
entryRuleState returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getStateRule()); }
	iv_ruleState=ruleState
	{ $current=$iv_ruleState.current; }
	EOF;

// Rule State
ruleState returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='state'
		{
			newLeafNode(otherlv_0, grammarAccess.getStateAccess().getStateKeyword_0());
		}
		(
			(
				lv_name_1_0=RULE_ID
				{
					newLeafNode(lv_name_1_0, grammarAccess.getStateAccess().getNameIDTerminalRuleCall_1_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getStateRule());
					}
					setWithLastConsumed(
						$current,
						"name",
						lv_name_1_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_2='{'
		{
			newLeafNode(otherlv_2, grammarAccess.getStateAccess().getLeftCurlyBracketKeyword_2());
		}
		(
			otherlv_3='entryActions:'
			{
				newLeafNode(otherlv_3, grammarAccess.getStateAccess().getEntryActionsKeyword_3_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getStateAccess().getEntryActionsArithmeticExpressionParserRuleCall_3_1_0());
					}
					lv_entryActions_4_0=ruleArithmeticExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getStateRule());
						}
						add(
							$current,
							"entryActions",
							lv_entryActions_4_0,
							"hu.bme.aut.statechartdsl.StatechartDSL.ArithmeticExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)+
		)?
		(
			otherlv_5='exitActions:'
			{
				newLeafNode(otherlv_5, grammarAccess.getStateAccess().getExitActionsKeyword_4_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getStateAccess().getExitActionsArithmeticExpressionParserRuleCall_4_1_0());
					}
					lv_exitActions_6_0=ruleArithmeticExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getStateRule());
						}
						add(
							$current,
							"exitActions",
							lv_exitActions_6_0,
							"hu.bme.aut.statechartdsl.StatechartDSL.ArithmeticExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)+
		)?
		(
			otherlv_7='transitions'
			{
				newLeafNode(otherlv_7, grammarAccess.getStateAccess().getTransitionsKeyword_5_0());
			}
			otherlv_8='{'
			{
				newLeafNode(otherlv_8, grammarAccess.getStateAccess().getLeftCurlyBracketKeyword_5_1());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getStateAccess().getTransitionsTransitionParserRuleCall_5_2_0());
					}
					lv_transitions_9_0=ruleTransition
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getStateRule());
						}
						add(
							$current,
							"transitions",
							lv_transitions_9_0,
							"hu.bme.aut.statechartdsl.StatechartDSL.Transition");
						afterParserOrEnumRuleCall();
					}
				)
			)+
			otherlv_10='}'
			{
				newLeafNode(otherlv_10, grammarAccess.getStateAccess().getRightCurlyBracketKeyword_5_3());
			}
		)?
		otherlv_11='}'
		{
			newLeafNode(otherlv_11, grammarAccess.getStateAccess().getRightCurlyBracketKeyword_6());
		}
	)
;

// Entry rule entryRuleTransition
entryRuleTransition returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getTransitionRule()); }
	iv_ruleTransition=ruleTransition
	{ $current=$iv_ruleTransition.current; }
	EOF;

// Rule Transition
ruleTransition returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='transition'
		{
			newLeafNode(otherlv_0, grammarAccess.getTransitionAccess().getTransitionKeyword_0());
		}
		otherlv_1='{'
		{
			newLeafNode(otherlv_1, grammarAccess.getTransitionAccess().getLeftCurlyBracketKeyword_1());
		}
		otherlv_2='event:'
		{
			newLeafNode(otherlv_2, grammarAccess.getTransitionAccess().getEventKeyword_2());
		}
		(
			(
				lv_event_3_0=RULE_ID
				{
					newLeafNode(lv_event_3_0, grammarAccess.getTransitionAccess().getEventIDTerminalRuleCall_3_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getTransitionRule());
					}
					setWithLastConsumed(
						$current,
						"event",
						lv_event_3_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_4='target:'
		{
			newLeafNode(otherlv_4, grammarAccess.getTransitionAccess().getTargetKeyword_4());
		}
		(
			(
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getTransitionRule());
					}
				}
				otherlv_5=RULE_ID
				{
					newLeafNode(otherlv_5, grammarAccess.getTransitionAccess().getTargetStateStateCrossReference_5_0());
				}
			)
		)
		(
			otherlv_6='guard:'
			{
				newLeafNode(otherlv_6, grammarAccess.getTransitionAccess().getGuardKeyword_6_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getTransitionAccess().getGuardConditionLogicalExpressionParserRuleCall_6_1_0());
					}
					lv_guardCondition_7_0=ruleLogicalExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getTransitionRule());
						}
						set(
							$current,
							"guardCondition",
							lv_guardCondition_7_0,
							"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)
		)?
		(
			otherlv_8='actions:'
			{
				newLeafNode(otherlv_8, grammarAccess.getTransitionAccess().getActionsKeyword_7_0());
			}
			(
				(
					{
						newCompositeNode(grammarAccess.getTransitionAccess().getActionsArithmeticExpressionParserRuleCall_7_1_0());
					}
					lv_actions_9_0=ruleArithmeticExpression
					{
						if ($current==null) {
							$current = createModelElementForParent(grammarAccess.getTransitionRule());
						}
						add(
							$current,
							"actions",
							lv_actions_9_0,
							"hu.bme.aut.statechartdsl.StatechartDSL.ArithmeticExpression");
						afterParserOrEnumRuleCall();
					}
				)
			)
			(
				otherlv_10=','
				{
					newLeafNode(otherlv_10, grammarAccess.getTransitionAccess().getCommaKeyword_7_2_0());
				}
				(
					(
						{
							newCompositeNode(grammarAccess.getTransitionAccess().getActionsArithmeticExpressionParserRuleCall_7_2_1_0());
						}
						lv_actions_11_0=ruleArithmeticExpression
						{
							if ($current==null) {
								$current = createModelElementForParent(grammarAccess.getTransitionRule());
							}
							add(
								$current,
								"actions",
								lv_actions_11_0,
								"hu.bme.aut.statechartdsl.StatechartDSL.ArithmeticExpression");
							afterParserOrEnumRuleCall();
						}
					)
				)
			)*
		)?
		otherlv_12='}'
		{
			newLeafNode(otherlv_12, grammarAccess.getTransitionAccess().getRightCurlyBracketKeyword_8());
		}
	)
;

// Entry rule entryRuleArithmeticExpression
entryRuleArithmeticExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getArithmeticExpressionRule()); }
	iv_ruleArithmeticExpression=ruleArithmeticExpression
	{ $current=$iv_ruleArithmeticExpression.current; }
	EOF;

// Rule ArithmeticExpression
ruleArithmeticExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getArithmeticExpressionAccess().getUnaryArithmeticExpressionParserRuleCall_0());
		}
		this_UnaryArithmeticExpression_0=ruleUnaryArithmeticExpression
		{
			$current = $this_UnaryArithmeticExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getArithmeticExpressionAccess().getBinaryArithmeticExpressionParserRuleCall_1());
		}
		this_BinaryArithmeticExpression_1=ruleBinaryArithmeticExpression
		{
			$current = $this_BinaryArithmeticExpression_1.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleBinaryArithmeticExpression
entryRuleBinaryArithmeticExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBinaryArithmeticExpressionRule()); }
	iv_ruleBinaryArithmeticExpression=ruleBinaryArithmeticExpression
	{ $current=$iv_ruleBinaryArithmeticExpression.current; }
	EOF;

// Rule BinaryArithmeticExpression
ruleBinaryArithmeticExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getBinaryArithmeticExpressionAccess().getPlusEqualsExpressionParserRuleCall_0());
		}
		this_PlusEqualsExpression_0=rulePlusEqualsExpression
		{
			$current = $this_PlusEqualsExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getBinaryArithmeticExpressionAccess().getMinusEqualsExpressionParserRuleCall_1());
		}
		this_MinusEqualsExpression_1=ruleMinusEqualsExpression
		{
			$current = $this_MinusEqualsExpression_1.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleMinusEqualsExpression
entryRuleMinusEqualsExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getMinusEqualsExpressionRule()); }
	iv_ruleMinusEqualsExpression=ruleMinusEqualsExpression
	{ $current=$iv_ruleMinusEqualsExpression.current; }
	EOF;

// Rule MinusEqualsExpression
ruleMinusEqualsExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='MEQ'
		{
			newLeafNode(otherlv_0, grammarAccess.getMinusEqualsExpressionAccess().getMEQKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getMinusEqualsExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_lhs_2_0=RULE_ID
				{
					newLeafNode(lv_lhs_2_0, grammarAccess.getMinusEqualsExpressionAccess().getLhsIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getMinusEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"lhs",
						lv_lhs_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getMinusEqualsExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				lv_rhs_4_0=RULE_INT
				{
					newLeafNode(lv_rhs_4_0, grammarAccess.getMinusEqualsExpressionAccess().getRhsINTTerminalRuleCall_4_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getMinusEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"rhs",
						lv_rhs_4_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getMinusEqualsExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRulePlusEqualsExpression
entryRulePlusEqualsExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getPlusEqualsExpressionRule()); }
	iv_rulePlusEqualsExpression=rulePlusEqualsExpression
	{ $current=$iv_rulePlusEqualsExpression.current; }
	EOF;

// Rule PlusEqualsExpression
rulePlusEqualsExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='PEQ'
		{
			newLeafNode(otherlv_0, grammarAccess.getPlusEqualsExpressionAccess().getPEQKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getPlusEqualsExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_lhs_2_0=RULE_ID
				{
					newLeafNode(lv_lhs_2_0, grammarAccess.getPlusEqualsExpressionAccess().getLhsIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getPlusEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"lhs",
						lv_lhs_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getPlusEqualsExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				lv_rhs_4_0=RULE_INT
				{
					newLeafNode(lv_rhs_4_0, grammarAccess.getPlusEqualsExpressionAccess().getRhsINTTerminalRuleCall_4_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getPlusEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"rhs",
						lv_rhs_4_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getPlusEqualsExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleUnaryArithmeticExpression
entryRuleUnaryArithmeticExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getUnaryArithmeticExpressionRule()); }
	iv_ruleUnaryArithmeticExpression=ruleUnaryArithmeticExpression
	{ $current=$iv_ruleUnaryArithmeticExpression.current; }
	EOF;

// Rule UnaryArithmeticExpression
ruleUnaryArithmeticExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getUnaryArithmeticExpressionAccess().getPreIncrementExpressionParserRuleCall_0());
		}
		this_PreIncrementExpression_0=rulePreIncrementExpression
		{
			$current = $this_PreIncrementExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getUnaryArithmeticExpressionAccess().getPreDecrementExpressionParserRuleCall_1());
		}
		this_PreDecrementExpression_1=rulePreDecrementExpression
		{
			$current = $this_PreDecrementExpression_1.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRulePreDecrementExpression
entryRulePreDecrementExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getPreDecrementExpressionRule()); }
	iv_rulePreDecrementExpression=rulePreDecrementExpression
	{ $current=$iv_rulePreDecrementExpression.current; }
	EOF;

// Rule PreDecrementExpression
rulePreDecrementExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='PREDEC'
		{
			newLeafNode(otherlv_0, grammarAccess.getPreDecrementExpressionAccess().getPREDECKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getPreDecrementExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_operand_2_0=RULE_ID
				{
					newLeafNode(lv_operand_2_0, grammarAccess.getPreDecrementExpressionAccess().getOperandIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getPreDecrementExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"operand",
						lv_operand_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=')'
		{
			newLeafNode(otherlv_3, grammarAccess.getPreDecrementExpressionAccess().getRightParenthesisKeyword_3());
		}
	)
;

// Entry rule entryRulePreIncrementExpression
entryRulePreIncrementExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getPreIncrementExpressionRule()); }
	iv_rulePreIncrementExpression=rulePreIncrementExpression
	{ $current=$iv_rulePreIncrementExpression.current; }
	EOF;

// Rule PreIncrementExpression
rulePreIncrementExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='PREINC'
		{
			newLeafNode(otherlv_0, grammarAccess.getPreIncrementExpressionAccess().getPREINCKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getPreIncrementExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_operand_2_0=RULE_ID
				{
					newLeafNode(lv_operand_2_0, grammarAccess.getPreIncrementExpressionAccess().getOperandIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getPreIncrementExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"operand",
						lv_operand_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=')'
		{
			newLeafNode(otherlv_3, grammarAccess.getPreIncrementExpressionAccess().getRightParenthesisKeyword_3());
		}
	)
;

// Entry rule entryRuleLogicalExpression
entryRuleLogicalExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getLogicalExpressionRule()); }
	iv_ruleLogicalExpression=ruleLogicalExpression
	{ $current=$iv_ruleLogicalExpression.current; }
	EOF;

// Rule LogicalExpression
ruleLogicalExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getLogicalExpressionAccess().getUnaryLogicalExpressionParserRuleCall_0());
		}
		this_UnaryLogicalExpression_0=ruleUnaryLogicalExpression
		{
			$current = $this_UnaryLogicalExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getLogicalExpressionAccess().getBinaryLogicalExpressionParserRuleCall_1());
		}
		this_BinaryLogicalExpression_1=ruleBinaryLogicalExpression
		{
			$current = $this_BinaryLogicalExpression_1.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleBinaryLogicalExpression
entryRuleBinaryLogicalExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getBinaryLogicalExpressionRule()); }
	iv_ruleBinaryLogicalExpression=ruleBinaryLogicalExpression
	{ $current=$iv_ruleBinaryLogicalExpression.current; }
	EOF;

// Rule BinaryLogicalExpression
ruleBinaryLogicalExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		{
			newCompositeNode(grammarAccess.getBinaryLogicalExpressionAccess().getEqualsExpressionParserRuleCall_0());
		}
		this_EqualsExpression_0=ruleEqualsExpression
		{
			$current = $this_EqualsExpression_0.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getBinaryLogicalExpressionAccess().getGreaterThanExpressionParserRuleCall_1());
		}
		this_GreaterThanExpression_1=ruleGreaterThanExpression
		{
			$current = $this_GreaterThanExpression_1.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getBinaryLogicalExpressionAccess().getLesserThanExpressionParserRuleCall_2());
		}
		this_LesserThanExpression_2=ruleLesserThanExpression
		{
			$current = $this_LesserThanExpression_2.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getBinaryLogicalExpressionAccess().getAndExpressionParserRuleCall_3());
		}
		this_AndExpression_3=ruleAndExpression
		{
			$current = $this_AndExpression_3.current;
			afterParserOrEnumRuleCall();
		}
		    |
		{
			newCompositeNode(grammarAccess.getBinaryLogicalExpressionAccess().getOrExpressionParserRuleCall_4());
		}
		this_OrExpression_4=ruleOrExpression
		{
			$current = $this_OrExpression_4.current;
			afterParserOrEnumRuleCall();
		}
	)
;

// Entry rule entryRuleAndExpression
entryRuleAndExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getAndExpressionRule()); }
	iv_ruleAndExpression=ruleAndExpression
	{ $current=$iv_ruleAndExpression.current; }
	EOF;

// Rule AndExpression
ruleAndExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='AND'
		{
			newLeafNode(otherlv_0, grammarAccess.getAndExpressionAccess().getANDKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getAndExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getAndExpressionAccess().getLhsLogicalExpressionParserRuleCall_2_0());
				}
				lv_lhs_2_0=ruleLogicalExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getAndExpressionRule());
					}
					set(
						$current,
						"lhs",
						lv_lhs_2_0,
						"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getAndExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getAndExpressionAccess().getRhsLogicalExpressionParserRuleCall_4_0());
				}
				lv_rhs_4_0=ruleLogicalExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getAndExpressionRule());
					}
					set(
						$current,
						"rhs",
						lv_rhs_4_0,
						"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getAndExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleOrExpression
entryRuleOrExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getOrExpressionRule()); }
	iv_ruleOrExpression=ruleOrExpression
	{ $current=$iv_ruleOrExpression.current; }
	EOF;

// Rule OrExpression
ruleOrExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='OR'
		{
			newLeafNode(otherlv_0, grammarAccess.getOrExpressionAccess().getORKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getOrExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getOrExpressionAccess().getLhsLogicalExpressionParserRuleCall_2_0());
				}
				lv_lhs_2_0=ruleLogicalExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getOrExpressionRule());
					}
					set(
						$current,
						"lhs",
						lv_lhs_2_0,
						"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getOrExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getOrExpressionAccess().getRhsLogicalExpressionParserRuleCall_4_0());
				}
				lv_rhs_4_0=ruleLogicalExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getOrExpressionRule());
					}
					set(
						$current,
						"rhs",
						lv_rhs_4_0,
						"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getOrExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleEqualsExpression
entryRuleEqualsExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getEqualsExpressionRule()); }
	iv_ruleEqualsExpression=ruleEqualsExpression
	{ $current=$iv_ruleEqualsExpression.current; }
	EOF;

// Rule EqualsExpression
ruleEqualsExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='EQ'
		{
			newLeafNode(otherlv_0, grammarAccess.getEqualsExpressionAccess().getEQKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getEqualsExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_lhs_2_0=RULE_ID
				{
					newLeafNode(lv_lhs_2_0, grammarAccess.getEqualsExpressionAccess().getLhsIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"lhs",
						lv_lhs_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getEqualsExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				lv_rhs_4_0=RULE_INT
				{
					newLeafNode(lv_rhs_4_0, grammarAccess.getEqualsExpressionAccess().getRhsINTTerminalRuleCall_4_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getEqualsExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"rhs",
						lv_rhs_4_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getEqualsExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleGreaterThanExpression
entryRuleGreaterThanExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getGreaterThanExpressionRule()); }
	iv_ruleGreaterThanExpression=ruleGreaterThanExpression
	{ $current=$iv_ruleGreaterThanExpression.current; }
	EOF;

// Rule GreaterThanExpression
ruleGreaterThanExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='GT'
		{
			newLeafNode(otherlv_0, grammarAccess.getGreaterThanExpressionAccess().getGTKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getGreaterThanExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_lhs_2_0=RULE_ID
				{
					newLeafNode(lv_lhs_2_0, grammarAccess.getGreaterThanExpressionAccess().getLhsIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getGreaterThanExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"lhs",
						lv_lhs_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getGreaterThanExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				lv_rhs_4_0=RULE_INT
				{
					newLeafNode(lv_rhs_4_0, grammarAccess.getGreaterThanExpressionAccess().getRhsINTTerminalRuleCall_4_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getGreaterThanExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"rhs",
						lv_rhs_4_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getGreaterThanExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleLesserThanExpression
entryRuleLesserThanExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getLesserThanExpressionRule()); }
	iv_ruleLesserThanExpression=ruleLesserThanExpression
	{ $current=$iv_ruleLesserThanExpression.current; }
	EOF;

// Rule LesserThanExpression
ruleLesserThanExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='LT'
		{
			newLeafNode(otherlv_0, grammarAccess.getLesserThanExpressionAccess().getLTKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getLesserThanExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				lv_lhs_2_0=RULE_ID
				{
					newLeafNode(lv_lhs_2_0, grammarAccess.getLesserThanExpressionAccess().getLhsIDTerminalRuleCall_2_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getLesserThanExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"lhs",
						lv_lhs_2_0,
						"org.eclipse.xtext.common.Terminals.ID");
				}
			)
		)
		otherlv_3=','
		{
			newLeafNode(otherlv_3, grammarAccess.getLesserThanExpressionAccess().getCommaKeyword_3());
		}
		(
			(
				lv_rhs_4_0=RULE_INT
				{
					newLeafNode(lv_rhs_4_0, grammarAccess.getLesserThanExpressionAccess().getRhsINTTerminalRuleCall_4_0());
				}
				{
					if ($current==null) {
						$current = createModelElement(grammarAccess.getLesserThanExpressionRule());
					}
					setWithLastConsumed(
						$current,
						"rhs",
						lv_rhs_4_0,
						"org.eclipse.xtext.common.Terminals.INT");
				}
			)
		)
		otherlv_5=')'
		{
			newLeafNode(otherlv_5, grammarAccess.getLesserThanExpressionAccess().getRightParenthesisKeyword_5());
		}
	)
;

// Entry rule entryRuleUnaryLogicalExpression
entryRuleUnaryLogicalExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getUnaryLogicalExpressionRule()); }
	iv_ruleUnaryLogicalExpression=ruleUnaryLogicalExpression
	{ $current=$iv_ruleUnaryLogicalExpression.current; }
	EOF;

// Rule UnaryLogicalExpression
ruleUnaryLogicalExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	{
		newCompositeNode(grammarAccess.getUnaryLogicalExpressionAccess().getNotExpressionParserRuleCall());
	}
	this_NotExpression_0=ruleNotExpression
	{
		$current = $this_NotExpression_0.current;
		afterParserOrEnumRuleCall();
	}
;

// Entry rule entryRuleNotExpression
entryRuleNotExpression returns [EObject current=null]:
	{ newCompositeNode(grammarAccess.getNotExpressionRule()); }
	iv_ruleNotExpression=ruleNotExpression
	{ $current=$iv_ruleNotExpression.current; }
	EOF;

// Rule NotExpression
ruleNotExpression returns [EObject current=null]
@init {
	enterRule();
}
@after {
	leaveRule();
}:
	(
		otherlv_0='NOT'
		{
			newLeafNode(otherlv_0, grammarAccess.getNotExpressionAccess().getNOTKeyword_0());
		}
		otherlv_1='('
		{
			newLeafNode(otherlv_1, grammarAccess.getNotExpressionAccess().getLeftParenthesisKeyword_1());
		}
		(
			(
				{
					newCompositeNode(grammarAccess.getNotExpressionAccess().getOperandLogicalExpressionParserRuleCall_2_0());
				}
				lv_operand_2_0=ruleLogicalExpression
				{
					if ($current==null) {
						$current = createModelElementForParent(grammarAccess.getNotExpressionRule());
					}
					set(
						$current,
						"operand",
						lv_operand_2_0,
						"hu.bme.aut.statechartdsl.StatechartDSL.LogicalExpression");
					afterParserOrEnumRuleCall();
				}
			)
		)
		otherlv_3=')'
		{
			newLeafNode(otherlv_3, grammarAccess.getNotExpressionAccess().getRightParenthesisKeyword_3());
		}
	)
;

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
