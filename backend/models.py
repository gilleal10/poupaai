from sqlalchemy import Column, Integer, String, Float, ForeignKey, DateTime
from sqlalchemy.orm import declarative_base, relationship
from datetime import datetime

Base = declarative_base()

class Conta(Base):
    __tablename__ = 'contas'
    id = Column(Integer, primary_key=True, index=True)
    nome = Column(String, index=True)
    tipo = Column(String) # 'fixa' ou 'variavel'
    valor_previsto = Column(Float, nullable=True)
    despesas = relationship("Despesa", back_populates="conta")

class CartaoCredito(Base):
    __tablename__ = 'cartoes'
    id = Column(Integer, primary_key=True, index=True)
    banco = Column(String, index=True)
    limite = Column(Float)
    dia_fechamento = Column(Integer)
    despesas = relationship("Despesa", back_populates="cartao")

class Despesa(Base):
    __tablename__ = 'despesas'
    id = Column(Integer, primary_key=True, index=True)
    descricao = Column(String)
    valor = Column(Float)
    data = Column(DateTime, default=datetime.utcnow)
    comprovante_url = Column(String, nullable=True) # Foto da camera
    conta_id = Column(Integer, ForeignKey('contas.id'), nullable=True)
    cartao_id = Column(Integer, ForeignKey('cartoes.id'), nullable=True)
    
    conta = relationship("Conta", back_populates="despesas")
    cartao = relationship("CartaoCredito", back_populates="despesas")
