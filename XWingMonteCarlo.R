#Monte Carlo Simulation
#CPT Sharritt Tutorial

################################

#Incoming Caveats!!!  READ ME FIRST!

#This is a tutorial or example of sorts.  It is not intended to be a 'cut and paste'
#opportunity for you as a student to plug in numbers for any particular project, but more as 
#a commentary as to the processes in modelling and solving a probability prompt.  So keep these
#two things in mind.

#One - DO NOT simply type in your answers here and overwrite my code.  Run this code and 
#understand what's happening, then make a new script and try your prompt.

#Two - if I am not your instructor, CITE THIS TUTORIAL.  This is not common knowledge. These
#are not plans to the Death Star and many Bothans did not die getting them to you.  You must
#cite this document if you received any benefit from it unless you are in MA206 Sections B10 or C10.
#Those chosen 34 are my trusted agents.  If they share it with you (get it), you must still document.

#Good luck, and may the Force be with you.

################################

#Let's pretend that I love X-wing fighter models.  I'm like Mel Gibson's character in the
#movie 'Conspiracy Theory' in that if I am out and I find one, I have to buy each I find.  Let's model the 
#number of X-wing fighters available by a binomial distribution with n = 3 and the probability
#of them being there is p = .30 .  This means that I am not likely to find one, but if and
#when I do, I must purchase it for $20 a piece.

#Now that I've purchased an X-wing, I will need to purchase supplies to build the model.
#The amount of money I will spend will follow an Exponential distribution with a lambda
#equal to .20 .  If I don't find any X-wings, I will not spend any money.

#Finally, if I buy two or more X-wings, I must make some room for my collection
#thus I have to purchase a bookcase with a purchase price modelled by a 
#normal distribution with a mean of $30 and a standard deviation of $4.

#I want to know three things: a) what should I expect to pay anytime I am out, b) what
#is the range of costs as I go out into the city and c) what does the distribution of costs
#look like?

################################

#If I am going to do a Monte Carlo Simulation, I want to have a substantial # of trials.
#1000 seems reasonable.

num.trials=1000                  #specified the # of trials done is equal to 1000. 

#Now let's see how many X-wings that I purchase in 1000 trials

XP=rbinom(num.trials,3,.3)       #I have now made a vector with 1000 entries of possible X-wings purchased
XP                               #This looks at all of the 1000 entries.  They range from 0-3.

#It's important to note that I'm using the rbinom function here.  Binomial is a named discrete distribution,
#thus R has a command that will give me a random value for X given that I have proper parameters input into
#the function, in this case n=3 and p=.30.  I ran 1000 trials, thus my vector has 1000 entries for XP.

#How much am I paying for the X-wings themselves?

XPCost=XP*20                     #I take the vector XP and multiply by $20.
XPCost                           #This looks at all 1000 possibilities. I see 0, 20, 40 and a few 60s.

#################################

#Alright, so I may have purchased an X-wing or two (or three) so now I need to purchase supplies (if I purchased any at all).
#Do I need to purchase any supplies?  Only if I bought an X-wing.  So what does that look like?

#I'll make a new variable called NeedSup to represent whether I need supplies or not.  This variable will be a true
#or false variable (which is like a 1 or 0 in many computer languages).  I'll have a 1000 of these T or F.

NeedSup=(XP>0)                  #This vector gives me a true if I purchased any X-wings and a false if I did not.
NeedSup                         #Here's a look at 1000 true or false responses.

#I can freely make a vector that contains 1000 possible supply costs based on the given prompt, namely that
#my supply costs are Exponentially distributed with a lambda of .20.  

#Using the same idea as the Binomial distribution above (a named distribution and the function rNAMEDTHING),
#I'll calculate my 1000 trials using the rexp function.

Sup=rexp(num.trials,.2)         #This vector contains 1000 random samples from this distribution
Sup                             #Here's a look at the supply costs.

#I notice that my supply costs are not clean, meaning that there are more than 2 significant digits (dollars and cents).
#In order to clean that up, I'm going to use the round function to round my supply costs.

SupRd=round(Sup,2)              #I used the round function to round to two significant digits
SupRd                           #Looks like we're good to go with our 1000 possible costs

################################

#Now, do I need a bookcase every time?  No.  I only need a bookcase when I buy 2 or 3 X-wings.
#So what does that look like?

NeedBC=(XP>1)                    #I've created a bunch of true/false statements based on if the
                                 #number of X-wings purchased is greater than 1.
NeedBC                           #This shows the trues or falses based on the conditional statement above

#So in this step, we'll calculate the price of the bookcase in the event we need one.  The price was normally
#distributed with a mean of 30 and a standard deviation of 4.  

#Much like the binomial distribution above, we have another named distribution that R can deal with directly.
#We'll use the rnorm function with 1000 trials, mean = 30 and standard deviation = 4.

BCCost=rnorm(num.trials,30,4)    #Bookcase Cost (BCCost) has 1000 entries in it representing the possible costs of bookcases.
BCCost                           #So these numbers have all sorts of decimals.  Let's get rid of them
BCCostRd=round(BCCost,2)         #I used the round function to round to two significant digits
BCCostRd                         #Looks like we're good to go with our 1000 possible costs

#################################

#Finally, I want to calculate the costs of my X-wings, the costs of supplies and the cost of a bookcase.
#I have to keep in mind that both supplies and a bookcase are dependent on other factors, thus I can't just
#add them.  I have to use the proper formula to put it all together.

TotalCost = XPCost + NeedSup*SupRd + NeedBC*BCCostRd   #Here's the final formula
TotalCost                                              #And this displays the 1000 costs.

#The key here is to recognize that the product of NeedSup * SupRd will be 0 when NeedSup is false, otherwise it
#will be SupRd when NeedSup is true.  The same logic statement works for Bookcase costs.

#I have 1000 total costs.  If I wanted to find the expected costs, I would simply take the average of my costs.

mean(TotalCost)                  #I calculated the mean.

#If I want to calculate a good range of my regular costs for the X-wings.

quantile(TotalCost,probs=c(.05,.95))  #I've calculated the 90% interval for the X-wing costs.

#And last but not least, what does the distribution look like?

hist(TotalCost,main="Histogram of Total X-wing Costs",xlab="Total Costs ($)")
