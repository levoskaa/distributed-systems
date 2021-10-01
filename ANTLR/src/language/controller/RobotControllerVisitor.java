// Generated from D:/Projektek/distributed-systems/ANTLR/src/language/controller\RobotController.g4 by ANTLR 4.9.1
package language.controller;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link RobotControllerParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface RobotControllerVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link RobotControllerParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(RobotControllerParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link RobotControllerParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(RobotControllerParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link RobotControllerParser#moveStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMoveStatement(RobotControllerParser.MoveStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link RobotControllerParser#rotateStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRotateStatement(RobotControllerParser.RotateStatementContext ctx);
}