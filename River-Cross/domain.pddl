(define (domain crossriver)
  
  (:requirements :adl :fluents :equality) 
  
  (:types         
    location locatable - object
    animal - locatable
    lion gnu - animal
	boat - locatable
  )
  
  (:functions
	(number-lions ?l - location)
	(number-gnus ?g - location)
	(lions-on-board ?n - boat)
	(gnus-on-board ?k - boat)
  )
  
  (:predicates
		(on ?obj - locatable ?loc - location)
		(in-boat ?ani - animal ?boa - boat)
		(path ?location1 - location ?location2 - location)
  )

  (:action sail
	:parameters
	(?barca - boat
	?from - location
	?to - location)
	
	:precondition
	(and
		(path ?from ?to)
		(> (+ (gnus-on-board ?barca) (lions-on-board ?barca)) 0) ; The boat may not leave alone!
		(or
			(>= (+ (gnus-on-board ?barca) (number-gnus ?to)) (+ (lions-on-board ?barca) (number-lions ?to))) 
			(= (+ (gnus-on-board ?barca) (number-gnus ?to)) 0)
		)
		(or
			(>= (number-gnus ?from) (number-lions ?from))
			(= (number-gnus ?from) 0)
		)
	)
	
	:effect
	(and
		(on ?barca ?to)
		(not (on ?barca ?from))
	)
  )
  
  (:action get-lion-on-board
	:parameters
	(?lio - lion
	?barca - boat
	?loc - location)
	
	:precondition
	(and
		(< (+ (gnus-on-board ?barca) (lions-on-board ?barca) ) 2)
		(on ?barca ?loc)
		(on ?lio ?loc)
	)
	
	:effect
	(and
		(in-boat ?lio ?barca)
		(increase (lions-on-board ?barca) 1)
		(decrease (number-lions ?loc) 1)
		(not (on ?lio ?loc))
	)
  )
  
  (:action get-gnu-on-board
	:parameters
	(?gnu - gnu
	?barca - boat
	?loc - location)
	
	:precondition
	(and
		(< (+ (gnus-on-board ?barca) (lions-on-board ?barca) ) 2)
		(on ?barca ?loc)
		(on ?gnu ?loc)
	)
	
	:effect
	(and
		(in-boat ?gnu ?barca)
		(increase (gnus-on-board ?barca) 1)
		(decrease (number-gnus ?loc) 1)
		(not (on ?gnu ?loc))
	)
  )

  (:action disembark-lion
	:parameters
	(?lio - lion
	?barca - boat
	?loc - location)
	
	:precondition
	(and
		(on ?barca ?loc)
		(in-boat ?lio ?barca)
	)
	
	:effect
	(and
		(decrease (lions-on-board ?barca) 1)
		(not (in-boat ?lio ?barca))
		(increase (number-lions ?loc) 1)
		(on ?lio ?loc)
	)
  )
  
   (:action disembark-gnu
	:parameters
	(?gnu - gnu
	?barca - boat
	?loc - location)
	
	:precondition
	(and
		(on ?barca ?loc)
		(in-boat ?gnu ?barca)
	)
	
	:effect
	(and
		(decrease (gnus-on-board ?barca) 1)
		(not (in-boat ?gnu ?barca))
		(increase (number-gnus ?loc) 1)
		(on ?gnu ?loc)
	)
  )




)
