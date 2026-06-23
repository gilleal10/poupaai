import scipy.optimize as optimize

def calculate_cet_newton_raphson(principal, installment, periods):
    """
    Calculates the Cost of Effective Total (CET) using Newton-Raphson method.
    Returns the monthly interest rate.
    Equation: Principal - sum(Installment / (1 + r)^t) = 0
    """
    def npv(rate):
        return principal - sum([installment / ((1 + rate) ** t) for t in range(1, periods + 1)])
    
    try:
        # Initial guess for rate is 0.05 (5%)
        rate = optimize.newton(npv, 0.05)
        return rate
    except Exception as e:
        return None

def compare_with_market_rates(cet_rate):
    """
    Mock integration with Bacen API.
    Returns market rates for comparison.
    """
    return {
        "cet_monthly": round(cet_rate * 100, 2) if cet_rate else 0.0,
        "selic_monthly": 0.85,
        "cdi_monthly": 0.84,
        "ipca_monthly": 0.30
    }
