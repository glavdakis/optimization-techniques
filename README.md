# Optimization Techniques

This repository contains assignments completed for the **Optimization Techniques** course at the **Department of Electrical and Computer Engineering (ECE), Aristotle University of Thessaloniki (AUTH)** during the **2024–2025 academic year**.

Each folder contains the MATLAB source (`src/`), the generated figures (`plots/`), the assignment and the report (in Greek).

## 📋 Contents

### 📁 Work 1: Line Search Methods (Single-Variable Minimization)
Minimization of $f_1(x) = (x-2)^2 + x\ln(x+3)$, $f_2(x) = e^{-2x} + (x-2)^2$ and $f_3(x) = e^x(x^3-1) + (x-1)\sin x$ on the interval $[-1, 3]$.
* **1.1 Bisection Method**: Number of objective function evaluations as a function of the distance $\epsilon$ (for fixed final interval length $l = 0.01$) and of $l$ (for fixed $\epsilon = 0.001$), and convergence of the interval $[a_k, b_k]$ vs. iteration $k$ for several values of $l$.
* **1.2 Golden Section Method**: Function evaluations vs. $l$ and convergence of $[a_k, b_k]$; each iteration reuses one of the two previous points.
* **1.3 Fibonacci Method**: The same study, with the number of iterations fixed in advance by the smallest Fibonacci number $F_n > (b_1 - a_1)/l$.
* **1.4 Bisection Method with Derivative**: The same study, halving the interval based on the sign of $f'(x_k)$ at the midpoint.
* **Comparison**: For $l = 0.005$–$0.05$, bisection needs the most evaluations (22–14), followed by golden section (16–12) and Fibonacci (15–10), while bisection with derivative needs the fewest (10–7).

### 📁 Work 2: Unconstrained Multivariable Minimization
Minimization of $f(x, y) = x^5 e^{-x^2-y^2}$ with termination $\|\nabla f\| < \epsilon = 0.001$, from the starting points $(0,0)$, $(-1,1)$ and $(1,-1)$, using three step-size rules: constant $\gamma_k = 0.1$, $\gamma_k$ minimizing $f(x_k + \gamma_k d_k)$ (found with bisection with derivative), and the Armijo rule.
* **2.1 Steepest Descent**: From $(0,0)$ the gradient is already zero, so the method stops at a non-optimal stationary point. From $(-1,1)$ it converges to the minimum, while from $(1,-1)$ it moves onto the flat region near $x = 0$ where the gradient vanishes.
* **2.2 Newton's Method**: The Hessian is not positive definite at any of the three starting points, so Newton's method is not applicable there. It is demonstrated from $(-1.7, 0.2)$ instead.
* **2.3 Levenberg–Marquardt**: The Hessian is shifted by $\mu_k I$ so that it becomes positive definite, and the method is run with all three step-size rules.
* **2.4 Comparison**: A bar chart of the number of iterations for every method, step-size rule and starting point.

### 📁 Work 3: Steepest Descent with Projection
Minimization of $f(x_1, x_2) = \frac{1}{3}x_1^2 + 3x_2^2$.
* **3.1 Steepest Descent**: Unconstrained, from $(-4, 4)$ with $\epsilon = 0.001$ and $\gamma_k = 0.1, 0.3, 3, 5$. Analytically, the iterates converge to $(0,0)$ only for $0 < \gamma_k < 1/3$, which the experiments confirm.
* **3.2 Steepest Descent with Projection**: Constrained to the box $-10 \le x_1 \le 5$, $-8 \le x_2 \le 12$ with $\epsilon = 0.01$, for three combinations of step $s_k$, step size $\gamma_k$ and starting point:
  * $s_k = 5$, $\gamma_k = 0.5$ from $(5, -5)$ and $s_k = 15$, $\gamma_k = 0.1$ from $(-5, 10)$: the method oscillates instead of converging, because $s_k\gamma_k$ is too large.
  * $s_k = 0.1$, $\gamma_k = 0.2$ from the infeasible point $(8, -10)$: the start is projected onto the box and the method converges to the minimum.

### 📁 Project: Traffic Network Optimization with a Genetic Algorithm
Minimization of the total travel time per vehicle $\frac{1}{V}\sum_i x_i T_i(x_i)$ of a 17-road traffic network, where the time on road $i$ is $T_i = t_i + a_i \frac{x_i}{1 - x_i/c_i}$, subject to flow conservation at every node and road capacities $0 \le x_i < c_i$.
* **Fixed inflow ($V = 100$ vehicles/min)**: A real-coded genetic algorithm with chromosomes of the 17 flows $x_i$. It uses fitness $1/f(x)$, roulette-wheel selection, crossover by averaging two parents, and elitism. Mutation adds a Gaussian change to one of $x_1$–$x_4$, then redistributes it so that all the constraints still hold. Offspring that violate the constraints are rejected. Over 10 runs the result is within 2% of the global optimum (173.74 min per vehicle, computed with `fmincon`).
* **Varying inflow ($V$ within ±15%)**: $V$ is added to the chromosome as an 18th gene, so the algorithm also optimizes over the inflow. It always ends close to $V = 85$, since the travel time per vehicle grows with the traffic.
