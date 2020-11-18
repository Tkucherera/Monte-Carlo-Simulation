
#@Tinashe Kucherera
#Probability and statistics
#Semester Project: Monte Carlo Simulation
#Sharritt major help gotten from tutorial 

#the simulation is going to be for 1000 trials as per question specification 
num_trials = 1000

#expected trucks for 1000 trials 
Expected_truck = rbinom(num_trials,4,0.96)

#defining the number of fuel diliveries required per day 
#confirm if right
x = runif(num_trials,0,40)
deliveries_required = -0.00125*x + 40.05

#delieveries made during duty time per truck
duty_dayd = rpois(num_trials,12)

#overtime deliveries made if needed each truck
overtime_deliveries = rpois(num_trials,6)

#duty day cost per truck 
duty_daycost = 400 + rexp(num_trials,1/15)

#overtime cost per truck 
overtime_cost = 300 + rgamma(num_trials,shape = 14,rate = 1/6)



#The number of overtime deliveries needed will be calculated  by 
#subtracting the number of duty deliveries made from the number of daily deliveries needed and
#collecting all values greater that zero

Overtime_needed = ((deliveries_required - (duty_dayd*Expected_truck)>0))


fulfillment = (((overtime_deliveries + duty_dayd)*Expected_truck)>=deliveries_required)

#the cost is going to be the duty day cost plus overtime if any overtime is done
for (value in Overtime_needed){
if (value == TRUE){
  cost = overtime_cost + duty_daycost
} else {
  cost = duty_daycost
}}
print(mean(cost))

#the range of daily costs in the middle 95% 
quantile(cost,probs=c(0.025,0.975))
#the histogram 
hist(cost,main="potential daily fuel delivery cost",xlab="daily cost ($)")

#percentage of deliveries fulfilled 
l=length(fulfillment[fulfillment == TRUE])
percentage = (l/num_trials)*100
print(percentage)


#note when there is overtime the distribution is close to normal 
#whn the is no overtime the distribution is exp 
