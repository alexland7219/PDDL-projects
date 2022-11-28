(define (problem crossriver-simple)
	(:domain crossriver)
	(:objects
    	l1 l2 l3 - lion
    	g1 g2 g3 - gnu
    	barca - boat
    	right left - location
	)
	(:init
		(= (number-lions right) 3)
		(= (number-gnus right) 3)
		(= (number-lions left) 0)
		(= (number-gnus left) 0)
		(= (lions-on-board barca) 0)
		(= (gnus-on-board barca) 0)
		(on l1 right)
		(on l2 right)
		(on l3 right)
		(on g1 right)
		(on g2 right)
		(on g3 right)
		(on barca right)
		(path left right)
		(path right left)
	)
	(:goal
		(and 
		(on l1 left)
		(on l2 left)
		(on l3 left)
		(on g1 left)
		(on g2 left)
		(on g3 left)
		)
	)
)
