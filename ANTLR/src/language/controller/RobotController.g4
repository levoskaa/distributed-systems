grammar RobotController;

program: statement+;
statement: moveStatement | rotateStatement;
moveStatement: MOVE EOS;
rotateStatement: ROTATE EOS;

MOVE: 'move';
ROTATE: 'rotate';
EOS: ';';

WS: (' '| '\t' | '\n' | '\r') -> skip;
COMMENT: '/*' .*? '*/' -> skip;
LINE_COMMENT: '//' ~[\r\n]* -> skip;