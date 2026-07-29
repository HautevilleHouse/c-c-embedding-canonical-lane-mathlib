import CCEmbeddingCanonicalLaneLean.CCEmbeddingAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure LipschitzEmbedding (X Y : CCEmbeddingSpace) where
  embedFunc : X.carrier → Y.carrier
  LipschitzConst : ℝ
  LipschitzBound : 0 ≤ LipschitzConst
  LipschitzCond : ∀ x y, Y.metric (embedFunc x) (embedFunc y) ≤ LipschitzConst * X.metric x y
  injective : Function.Injective embedFunc

theorem lipschitz_embedding_composes (X Y Z : CCEmbeddingSpace)
    (f : LipschitzEmbedding X Y) (g : LipschitzEmbedding Y Z) :
    ∃ (h : LipschitzEmbedding X Z), True := by
  refine ⟨{ embedFunc := g.embedFunc ∘ f.embedFunc,
           LipschitzConst := g.LipschitzConst * f.LipschitzConst,
           LipschitzBound := mul_nonneg g.LipschitzBound f.LipschitzBound,
           LipschitzCond := ?_,
           injective := Function.Injective.comp g.injective f.injective }, trivial⟩
  intro x y
  calc
    Z.metric (g.embedFunc (f.embedFunc x)) (g.embedFunc (f.embedFunc y))
        ≤ g.LipschitzConst * Y.metric (f.embedFunc x) (f.embedFunc y) := g.LipschitzCond _ _
    _ ≤ g.LipschitzConst * (f.LipschitzConst * X.metric x y) := by
          nlinarith [f.LipschitzCond x y]
    _ = (g.LipschitzConst * f.LipschitzConst) * X.metric x y := by ring

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
