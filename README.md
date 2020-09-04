# ProgrammingLanguages

## Language Interpreter 
Complete and extend two implementations of an interpreter for a small “language” for two-dimensional geometry objects.The SML implementation is structured with functions and pattern-matching. The Ruby implementation is structured with subclasses and methods, including double dispatch and other dynamic dispatch to stick with an OOP style.

The language has 5 values :
- NoPoint: empty set of two-dimensional points.
- Point(x,y): two-dimensional point with an x-coordinate and a y-coordinate. Both coordinates are floating-point numbers.
- Line: non-vertical infinite line in the plane, represented by a slope and an intercept (as in y = mx + b where m is the slope and b is the intercept)
- VerticalLine: infinite vertical line in the plane, represented by its x-coordinate.
- LineSegment: finite line represented by the x- and y-coordinates of its endpoints.

The language has 4 expressions :
- Intersect(value1, value2): return the value that is the intersection of the two subresult.For example, the intersection of two lines could be one of:
    NoPoints, if the lines are parallel
    a Point, if the lines intersect
    a Line, if the lines have the same slope and intercept (see the note below about what “the same”means for floating-point numbers)
- Let: The first subexpression is evaluated and the result bound to a variable that is added to the environment for evaluating the second subexpression.
- Var: It is for using variables in the environment: We look up a string in the environment to get a geometric value.
- Shift(dx,dy,value):Shift the value by deltaX and deltaY.More specifically, shifting for each form of value is as follows:
    NoPoints remains NoPoints.
    Point(x, y) becomes a Point representing (x + deltaX , y + deltaY ).
    Line with slope m and intercept b becomes a Line with slope m and an intercept of b + deltaY − m · deltaX .
    VerticalLine becomes a VerticalLine shifted by deltaX.
    LineSegment has its endpoints shift by deltaX and deltaY.
    
## Tetris Game 

While explaining a ruby concept in class my professor used an implementation of Tetris Game in Ruby. After the class, I asked for the code from the professor, apparently it turned out to be open-sourced. After I understood the code, I changed the code to introduce some enhancements to the code:

- Player can press the ’u’ key to make the piece that is falling rotate 180 degrees.
- In the game, instead of the pieces being randomly (and uniformly) chosen from the 7 classic pieces,the pieces are randomly (and uniformly) chosen from 10         pieces I added three new pieces. 
- Initial rotation for each piece is also chosen randomly.
- In the game the player can press the ’c’ key to cheat: If the score is less than 100, nothing happens.Else the player loses 100 points and the next piece that     appears is a 1X1 square. The piece after is again chosen randomly from the 10 above (unless, of course, the player hits ’c’ while the “cheat piece” is falling     and still has a large enough score). Hitting ’c’ multiple times while a single
  piece is falling should behave no differently than hitting it once.
