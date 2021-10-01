// Generated from D:/Projektek/distributed-systems/ANTLR/src/language/controller\RobotController.g4 by ANTLR 4.9.1
package language.controller;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link RobotControllerParser}.
 */
public interface RobotControllerListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link RobotControllerParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(RobotControllerParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link RobotControllerParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(RobotControllerParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link RobotControllerParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(RobotControllerParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link RobotControllerParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(RobotControllerParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link RobotControllerParser#moveStatement}.
	 * @param ctx the parse tree
	 */
	void enterMoveStatement(RobotControllerParser.MoveStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link RobotControllerParser#moveStatement}.
	 * @param ctx the parse tree
	 */
	void exitMoveStatement(RobotControllerParser.MoveStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link RobotControllerParser#rotateStatement}.
	 * @param ctx the parse tree
	 */
	void enterRotateStatement(RobotControllerParser.RotateStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link RobotControllerParser#rotateStatement}.
	 * @param ctx the parse tree
	 */
	void exitRotateStatement(RobotControllerParser.RotateStatementContext ctx);
}