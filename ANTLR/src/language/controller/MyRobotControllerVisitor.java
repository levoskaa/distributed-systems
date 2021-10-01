package language.controller;

import game.GameController;

public class MyRobotControllerVisitor extends RobotControllerBaseVisitor<Object> {
    private GameController controller;

    public MyRobotControllerVisitor(GameController controller) {
        this.controller = controller;
    }

    @Override
    public Object visitMoveStatement(RobotControllerParser.MoveStatementContext ctx) {
        int moveAmount;
        try {
            moveAmount  = Integer.parseInt(ctx.amount().INT().getText());
        } catch(Exception e) {
            moveAmount = 1;
        }
        for (int i = 0; i < moveAmount; i++) {
            controller.move();
        }
        return super.visitMoveStatement(ctx);
    }

    @Override
    public Object visitRotateStatement(RobotControllerParser.RotateStatementContext ctx) {
        controller.rotate();
        return super.visitRotateStatement(ctx);
    }

    @Override
    public Object visitLoopStatement(RobotControllerParser.LoopStatementContext ctx) {
        Object result = null;
        for (int i = 0; i < Integer.parseInt(ctx.amount().INT().getText()); i++) {
            for (RobotControllerParser.StatementContext stm : ctx.statement()) {
                result = visit(stm);
            }
        }
        return result;
    }

    @Override
    public Object visitLogStatement(RobotControllerParser.LogStatementContext ctx) {
        controller.displayMessage(ctx.logMessage().STRING().getText());
        return super.visitLogStatement(ctx);
    }
}