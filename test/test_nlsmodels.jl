mutable struct DummyNLSModel <: AbstractNLSModel
end

model = DummyNLSModel()

for mtd in [:residual!, :jac_structure_residual!, :jac_coord_residual!, :hess_structure_residual!]
  @eval @test_throws(MethodError, $mtd(model, [0], [1]))
end
for mtd in [:jprod_residual!, :jtprod_residual!, :hess_coord_residual!]
  @eval @test_throws(MethodError, $mtd(model, [0], [1], [2]))
end
@test_throws(MethodError, hprod_residual!(model, [0], 1, [2], [3]))

include("test_autodiff_nls_model.jl")
include("test_lls_model.jl")
include("test_feasibility_nls_model.jl")
