using Plots

x = Float64[]
y = Float64[]
z = Float64[]
xyz = [x, y, z]

σ, ρ, β = 10.0, 28.0, 8/3

push!.(xyz, 1)

t = 0
dt = 0.001

function dx(σ, y, x)
	σ*(y - x)
end

function dy(x, ρ, z, y)
	x*(ρ - z) - y
end

function dz(x, y, β, z)
	x*y - β*z
end

while t < 100
	push!(x, x[end] + dt*dx(σ, y[end], x[end]))
	push!(y, y[end] + dt*dy(x[end], ρ, z[end], y[end]))
	push!(z, z[end] + dt*dz(x[end], y[end], β, z[end]))
	global t = t + dt
end

plot(x, y, z, label=false, title="Lorenz Attractor")
savefig("lorenz.png")
