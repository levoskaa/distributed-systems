package language.controller;

import game.GameController;

public class MyRobotControllerVisitor extends RobotControllerBaseVisitor<Object> {
    private GameController controller;

    public MyRobotControllerVisitor(GameController controller) {
        this.controller = controller;
    }

    @Override
    public Object visitMoveStatement(RobotControllerParser.MoveStatementContext ctx) {
        controller.move();
        return super.visitMoveStatement(ctx);
    }

    @Override
    public Object visitRotateStatement(RobotControllerParser.RotateStatementContext ctx) {
        controller.rotate();
        return super.visitRotateStatement(ctx);
    }
}