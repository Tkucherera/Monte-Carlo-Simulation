# Monte-Carlo-Simulation
## Fuel delivery problem
Fuel Distribution in Your Area of Operations for 1XYZ Company
A recent increase in demand for your unit’s area of operations has required you
to consider contracting fuel delivery through a local distribution company. Your
organic resources are stretched too thin to reliably meet the increased demand for
fuel. The proposed contract states the following:

* The fuel distribution company has a total of four usable fuel trucks (variable
on a daily basis due to required maintenance). The availability of each individual truck has a probability of 0.96 and is independent of the availability of
the other trucks.

* If any fuel deliveries are required on a given day, the contract requires the distributor to launch all available trucks in order to accomplish the deliveries as
quickly as possible. In return, a daily fee will be paid for each truck launched.
The daily fee per truck varies with the price of fuel and covers the use of the
trucks for a full duty day. The number of stops the trucks can make each duty
day is variable according to influences such as weather, traffic, etc.

* If the available trucks are unable to complete the required stops scheduled for
the day during regular duty hours, all available trucks will continue into an
overtime period. The overtime fee per truck varies with the price of fuel and
covers the use of the trucks for a full overtime period. The number of stops the
trucks can make during an overtime period is variable according to influences
such as weather, traffic, etc.

## Modeling Information
After considering the different fuel delivery specifications outlined in the proposed contract, you propose a Monte Carlo simulation based on the following
contributing models:
- Fuel truck Availability: Let TA be the number of trucks available on a given
day.

  TA ∼ Binom(n = 4; p = .96)

- Required Fuel Deliveries: There are a minimum of 40 deliveries required per
day. Let FD be the number of additional fuel deliveries required on a given
day. (Note: Round simulated values up to the nearest integer.)

  FD ∼ f(x) where f(x) =−x/800 + 1/20  for 0 ≤ x ≤ 40

- Duty Day Deliveries: Let DD be the number of duty day deliveries each available truck makes on a given day. Assume each truck makes the same number
of deliveries.
  DD ∼ Poisson(λ = 12)
  
- Overtime Deliveries: Let OS be the number of overtime deliveries each available truck makes on a given day if needed. Assume each truck makes the
same number of deliveries.

  OD ∼ Poisson(λ = 6)

- Duty Day Cost: Assume each truck costs the same amount with a base price
of $400. Let DC be the additional cost applied to each truck based on current
fuel prices.

  DC ∼ Exp(λ =115)
  
- Overtime Cost: Assume each truck costs the same amount with a base price
$300. Let OC be the additional cost applied to each truck based on current fuel
prices.

  OC ∼ Gamma(α = 14,β =16)

## Required Analysis
The supervisor understands the unit’s fuel distribution capabilities must be augmented by a contracted fuel distribution company; however, the supervisor has
some reservations about this contract and wants you to answer the following questions:
- What is the expected cost per day for these contracted fuel delivery services?

- What is the anticipated range of daily costs for fuel delivery services? Report
an interval containing the middle 95% of your simulated daily expenditures.
Provide a histogram of daily costs to illustrate the distribution of potential
daily costs.

- On what percentage of simulated days did the fuel distributor fulfill the required fuel delivery mission (including any required overtime)?
