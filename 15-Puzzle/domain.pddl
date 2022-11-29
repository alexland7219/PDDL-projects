(define (domain fifteen-puzzle)
  
  (:requirements :adl :fluents :equality) 
  
  (:types         
     location piece - object
  )
  
  (:predicates
	(on ?p - piece ?loc - location)
	(is-empty ?loc - location)
	(path ?l1 - location ?l2 - location)
  )

  (:action MOVE
	:parameters
	(?from - location
	 ?to - location
	 ?p - piece
	)
	
	:precondition
	(and
		(is-empty ?to)
		(or
			(path ?from ?to)
			(path ?to ?from)
		)
		(on ?p ?from)
	)
	
	:effect
	(and
		(not (is-empty ?to))
		(is-empty ?from)
		(not (on ?p ?from))
		(on ?p ?to)
	)
	
	)
)
