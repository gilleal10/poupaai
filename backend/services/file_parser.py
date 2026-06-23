def parse_financial_file(file_content, filename):
    """
    Mocks parsing OFX/PDF/XLS.
    """
    if filename.endswith(".ofx"):
        return {"type": "ofx", "transactions": [{"date": "2023-10-01", "amount": -150.0, "desc": "Mercado"}]}
    return {"type": "unknown", "transactions": []}
