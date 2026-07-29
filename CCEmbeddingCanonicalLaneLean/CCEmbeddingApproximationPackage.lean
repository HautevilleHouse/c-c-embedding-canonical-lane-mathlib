import CCEmbeddingCanonicalLaneLean.CCEmbeddingObjects

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure StoneWeierstrassPackage (X : CCEmbeddingSpace) where
  subalgebra : Set (X.domain → X.codomain)
  containsConstant : Subalgebra.IsSubalgebra subalgebra
  separatesPoints : Subalgebra.SeparatesPoints subalgebra
  uniformClosure : UniformSpace.closure subalgebra = Set.univ

def StoneWeierstrassClosed {X : CCEmbeddingSpace} (P : StoneWeierstrassPackage X) : Prop :=
  P.containsConstant ∧ P.separatesPoints ∧ P.uniformClosure = Set.univ

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse