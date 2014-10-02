module Sodium.Nucleus.Pass.Compute (compute) where

import Control.Lens hiding (Index, Fold)
import Sodium.Nucleus.Program.Vector
import Sodium.Nucleus.Recmap.Vector (recmapped)

compute :: Program -> Program
compute = over recmapped computeExpression

computeExpression :: Expression -> Expression
computeExpression = recursively match

recursively :: (Expression -> Expression) -> (Expression -> Expression)
recursively f = \case
    e@(Access _ _) -> f e
    e@(Primary  _) -> f e
    Call op exprs  -> f $ Call op (map rf exprs)
    Fold op exprs expr -> f $ Fold op (map rf exprs) (rf expr)
    where rf = recursively f

match :: Expression -> Expression
match = \case
    Call OpId [expr] -> expr
    Fold OpMultiply [Primary (LitInteger 1)]     range -> Call OpProduct [range]
    Fold OpAdd      [Primary (LitInteger 0)]     range -> Call OpSum     [range]
    Fold OpAnd      [Primary (LitBoolean True )] range -> Call OpAnd'    [range]
    Fold OpOr       [Primary (LitBoolean False)] range -> Call OpOr'     [range]
    expr -> expr
