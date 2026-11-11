# Optimization Techniques

This repository contains the assignments for the **Optimization Techniques** course at ECE AUTH during the 2024–2025 academic year.

| Folder | Topic | Methods |
|---|---|---|
| `Work_1` | 1D minimization on an interval | Bisection, Golden Section, Fibonacci, Bisection with derivative |
| `Work_2` | Unconstrained minimization of $f(x,y) = x^5 e^{-x^2-y^2}$ | Steepest Descent, Newton, Levenberg–Marquardt with constant, line-search and Armijo steps |
| `Work_3` | Minimization of $f(x_1,x_2) = \frac{1}{3}x_1^2 + 3x_2^2$ with box constraints | Steepest Descent with Projection |
| `Project` | Minimizing travel time per vehicle in a 17-road traffic network | Genetic Algorithm |

## Work 1
Three functions are minimized on $[-1, 3]$ with four line search methods. For each method, the number of function evaluations is studied as a function of the final interval length $l$, along with how the interval $[a_k, b_k]$ shrinks at every iteration. Bisection with derivative needs the fewest evaluations. Among the derivative-free methods, Fibonacci is the most efficient, followed by Golden Section and Bisection.

## Work 2
The function is minimized from the starting points $(0,0)$, $(-1,1)$ and $(1,-1)$. Each method uses three step-size rules: a constant step, the step that minimizes $f(x_k + \gamma_k d_k)$, and the Armijo rule. Newton is not applicable at these points, because the Hessian is not positive definite there, so it is run from $(-1.7, 0.2)$ instead. Adaptive steps converge far faster than a constant step, and Levenberg–Marquardt is the fastest method. From $(0,0)$ and $(1,-1)$, the methods stop at stationary points instead of the minimum.

## Work 3
First, steepest descent without constraints is studied for four step sizes. It converges only for $0 < \gamma_k < 1/3$, as shown analytically and confirmed experimentally. Then, with projection onto the box $-10 \le x_1 \le 5$, $-8 \le x_2 \le 12$, three combinations of step size and starting point are tested. A too-large step causes oscillations around the minimum, while a small step converges even from an infeasible starting point.

## Project
The flows of the 17 roads are optimized under flow conservation at every node and the road capacities. A real-coded genetic algorithm is used, with roulette selection, arithmetic crossover, Gaussian mutation and elitism. For a fixed inflow of 100 vehicles/min, it gets within 2% of the global optimum computed with `fmincon`. When the inflow can vary by ±15% as an extra gene, it ends near the lowest value, since the travel time per vehicle grows with the traffic.
