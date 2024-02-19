### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 86c1ec42-3ef3-11eb-3682-93ac7af389cd
begin
	import Pkg
	Pkg.activate(mktempdir())
	
	Pkg.add("PlutoUI")
	using PlutoUI
		
	Pkg.add("Roots")
	using Roots
	
	Pkg.add("Plots")
	using Plots
	
	plotly()
	
end

# ╔═╡ e04247d2-3f14-11eb-2ccf-4b154d5987e9
begin
Pkg.add("QuadGK")
using QuadGK
end

# ╔═╡ 74c9594e-3f7a-11eb-032c-bf4054554020
begin
Pkg.add("Statistics")
using Statistics
end

# ╔═╡ 31c728d2-3f80-11eb-0939-dd10102bc8c0
begin
Pkg.add("SpecialFunctions")
using SpecialFunctions
end

# ╔═╡ e30dd66e-3ef1-11eb-36b9-db59deb654cb
md"# _Βασικές Αρχές Προγραμματισμού_

## Αριθμητικές εφαρμογές

"

# ╔═╡ 1f0d3df0-3ef2-11eb-0d82-db20d6b63826
md" ### Επίλυση Εξισώσεων
Η julia μπορεί να λύσει εξισώσεις, (γραμμικές, μη γραμμικές) με χρήση κατάλληλων πακέτων

##### _Εύρεση ριζών_
Ένα κατάλληλο πακέτο για την έυρεση ριζών εξίσωσης είναι το [`Roots`](https://github.com/JuliaMath/Roots.jl).

"

# ╔═╡ cf1ccd04-3ef3-11eb-364a-3f162a73a4bc
md" Η εντολή συντάσεται `find_zero(function,initial guess or method argument,method)`
για μία ρίζα (ποια -> ανάλογα τις αρχικές προσσεγγίσεις) ή `find_zeros()` για πολλαπλές ρίζες
"

# ╔═╡ a6050dd0-3ef3-11eb-2ce6-85b673092265
f(x) = exp(x) - x^4

# ╔═╡ aa267cac-3ef3-11eb-040e-1d562028f654
r1 = find_zero(f,3)

# ╔═╡ c1ba56ae-3ef3-11eb-0ebd-c32f937b260d
f(r1)

# ╔═╡ cd0890b6-3ef3-11eb-1b4c-6fb047b54d56
r2 = find_zero(f, (8,9), Bisection()) #Method Bisection

# ╔═╡ 0d2d3c46-3ef4-11eb-08d0-b9d61ca75879
r3 = find_zero(f, (-10, 0))  #Method Bisection

# ╔═╡ 18225140-3ef4-11eb-0f65-d9ad413b34a7
f(r2), f(r3) 

# ╔═╡ 32b1efca-3ef4-11eb-0cab-6318111ce885
find_zero(sin, BigFloat(3.0), Order16())

# ╔═╡ 633e91de-3ef4-11eb-2c88-9f4456ee3822
find_zeros(f, -10, 10)


# ╔═╡ 4d7da29e-3ef5-11eb-1f7e-67a32e7c3c78
xr1,xr2,xr3 = find_zeros(f, -10, 10)

# ╔═╡ a3b00286-3ef4-11eb-2f55-19be612622ea
begin
	x = collect(-10:0.01:10)
	y = f.(x)
	plot(x,y)
	scatter!([xr1 xr2 xr3],[f(xr1) f(xr2) f(xr3)])
end

# ╔═╡ 6ffbe812-3ef5-11eb-2c59-1349a122ef96
md" #### Η ακρίβεια στον υπολογιστή

_Εύρεση ρίζας (μεδοδος διχοτόμισης)_"

# ╔═╡ fcdb5f52-3efe-11eb-3e2f-291fd5d982f1
g(x) = x^2+7x-13

# ╔═╡ a85e4244-3f00-11eb-118f-57fcf4e28eb4
begin
	x1 = collect(-10:0.01:10)
	y1 = g.(x1)
	plot(x1,y1)
end

# ╔═╡ eebb9894-3ef7-11eb-3da9-694cf72594a7
begin
	eps1 = 10^-3
	a1 = -5
	b1 = 5
	roo = 0
	for i = 1:10^2
		m1 =(a1+b1)/2
		if abs(g(m1))<=eps1
			m1
			roo = m1;
			break
		else
			if g(a1)*g(m1)<0
				b1 = m1;
			else
				a1 = m1;
			end
		end
	end
end

# ╔═╡ 5f0af042-3f00-11eb-0a00-f585980ab677
roo

# ╔═╡ 7ef55596-3f00-11eb-25f7-3fda92d5a701
g(roo)

# ╔═╡ c2c676b0-3f00-11eb-009c-371ee10fccd6
md"_Τομή τροχίας_"

# ╔═╡ da88ce1a-3f00-11eb-1b50-e9c911898fe4
begin
	x_f = collect(0:0.001:6)
	y_c = -x_f.^3+5*x_f.^2+2*x_f.+2
	f1(x) = x^2-x-10
	y_f = f1.(x_f)
end


# ╔═╡ e269f9d4-3f0e-11eb-19d8-f9af9adc75e1
begin
	s1,s2 = 0,0
	for k =1:length(y_c)-1
		diff1 = y_c[k]-y_f[k]
		diff2 = y_c[k+1]-y_f[k+1]
		if diff1*diff2<0
			s1,s2 =x_f[k+1],y_f[k+1]
			break
		end
	end
end

# ╔═╡ f3c6a2ac-3f0e-11eb-0f35-3d736b676edc
begin
plot(x_f,y_c)
plot!(x_f,y_f)
plot!([s1],[s2],marker=:circle)
end

# ╔═╡ 759484f4-3f0f-11eb-2cb6-09d2b8a5f865
md" #### Επίλυση συστήματος αλγεβρκών εξισώσεων

"


# ╔═╡ 00e6302a-3f10-11eb-3287-159b670c5e35
A = [1 2 3; 2 31 2; 2 3 4]

# ╔═╡ 0bd7e640-3f10-11eb-09f2-978360227cd9
B = [1, 3, 4]

# ╔═╡ 14968282-3f10-11eb-3ab7-2b0e63cc0fd3
X = A\B

# ╔═╡ 57d6ec56-3f10-11eb-3f38-0bac7dc0819f
md" #### Αριθμητική Ολοκλήρωση 

_Κανόνας τραπεζίου_: Έστω ότι θέλουμε να ολοκληρώσουμε την συνάρτηση f(x) στο διάστημα $b\leq x\leq b$

$$\int_a^bf(x)dx$$

Γνωρίζουμε ότι ισχύει για c: $a\leq c\leq b$ :

$$\int_a^bf(x)dx = \int_a^cf(x)dx+\int_c^bf(x)dx$$

Η ιδέα είναι να \"σπάσουμε\" το διάστημα ολοκλήρωσης σε πολλά μικρά διαστήματα. Εάν αυτά έιναι αρκετά μικρά τότε ισχύει ότι:

$$\int_a^bf(x)dx \approx (b-a)\times \frac{f(a)+f(b)}{2}$$

εφόσων το διάστημα $h = b -a$ είναι αρκετά μικρό
"

# ╔═╡ 01125882-3f13-11eb-36e0-43a60b0ec7f3
md"_Εφαρμογή_"

# ╔═╡ 11d190c0-3f13-11eb-1f63-abdf232e6e38
begin
	xi = collect(0:0.001:(2*pi))
	yi = cos.(xi)
	I  = 0
	yI = zeros(length(xi))
	for i=2:1:length(yi)
		I = I + ((xi[i]-xi[i-1])*(yi[i]+yi[i-1]))/2
		yI[i] = I
	end
	I
	diffI = abs.(sin.(xi) - yI)
end

# ╔═╡ 374d3686-3f15-11eb-28b5-e16429a396f8
begin
	plot(xi,yi)
	plot!(xi,sin.(xi))
	plot!(xi,yI)
end

# ╔═╡ e4ec5864-3f13-11eb-36e0-1bca46758bff
q = quadgk(cos, 0, 2*pi)

# ╔═╡ 9ca79134-3f18-11eb-0f93-75ffd7d1f48f
md" #### Αριθμητική Παραγώγιση

Η παράγωγος μπορεί να προσσεγιστεί ως εξής:

$$f'|^a_b(x) \approx \frac{f(b) - f(a)}{b-a}$$

εφόσων το διάστημα $h = b -a$ είναι αρκετά μικρό
"

# ╔═╡ 5c181efa-3f19-11eb-327a-89243bdd57b8
begin
	yD = zeros(length(yi)-1)
	for i=1:1:length(yi)-1
		yD[i] = (yi[i+1]-yi[i])/(xi[i+1]-xi[i])
	end
	diffD = abs.(sin.(xi[1:length(xi)-1].+pi) - yD)
end

# ╔═╡ 89b5256a-3f19-11eb-2e65-9bcb02277f04
begin
	plot(xi,sin.(xi.+pi))
	plot!(xi[1:length(xi)-1],yD)
end

# ╔═╡ 83ecadc0-3f18-11eb-1f9e-d531ae5a2ffd
md" #### Επίλυση διφορικής εξίσωσης 

Το πρόβλημα αρχικών τιμών είναι ένα πρόβλημα στο οποίο ζητούμενο είναι η έυρεση μίας συνάρτησης, τέτοιας έτσι ώστε να ικανοποεί την παρακάτω εξίσωση

$$\frac{dy(t)}{dt} = f(t,y(t))$$

ενώ επίσης ικανοποιέιτε και η παρακάτω αρχική συνθήκη

$$y(t_0) = y_0$$

Από την μαθηματική ανάλυση, ισχύει ότι:

$$y(t+h) = y(t) + \int_t^{t+h}f(s,y(s))ds$$

Η βασική ιδέα είναι η επιλογή κατάλληλου βήματος h έτσι ώστε το πρόγραμμα να είναι αποδοτικό αλλά να μην στερείτε ακρίβειας
"

# ╔═╡ 55291d9e-3f7b-11eb-3ecf-83ab6a0566f4
md" ##### Μέθοδος Euler

Η πιο απλή μέθοδος αριθμιτικής επίλυσης προβλημάτων αρχικών τιμών είναι η μέθοδος Euler. Με σταθερό βήμα h, η λύση προκύπτει ότι έιναι:

$$y_{n+1} = y_n+hf(t_n,y_n)$$
$$t_{n+1} = t_n+h$$

Σημειώστε ότι δεν χρειάζεται αναλυτική έκφραση της f αλλά διανυσματική
"

# ╔═╡ 595b4912-3f7d-11eb-1d17-1bc18638dedd
md"_Παράδειγμα_"

# ╔═╡ dfa68c64-3f7f-11eb-0aff-eb852a23e8c3
erf_der(x) = (2/sqrt(pi))*exp(-x^2)

# ╔═╡ 96a47700-3f80-11eb-06ff-bdb8910d2a4e
y_0 = erf(0)

# ╔═╡ 6101efbe-3f81-11eb-0285-03c1558e9cb9
begin
	h = 0.001
	num_point = trunc(Int,10/h)
	y_erf = zeros(num_point)
	x_erf = zeros(num_point)
end

# ╔═╡ d6ad4dde-3f82-11eb-160b-4f7240c195ac
num_point

# ╔═╡ a30c8780-3f80-11eb-1027-e7bbf31fd9e7
begin
# Calculation of erf for [0, 10] , h = 0.1
	y_erf[1] = y_0
	x_erf[1] = 0
	for k =2:1:num_point
		y_erf[k] = y_erf[k-1]+h*erf_der(x_erf[k-1])
		x_erf[k] = x_erf[k-1]+h
	end
end

# ╔═╡ f0600620-3f82-11eb-012f-379c6ba075e1
size(y_erf)

# ╔═╡ e0d1045a-3f81-11eb-20d1-07eb1571785d
begin
	plot(x_erf,y_erf,marker=:circle)
	plot!(x_erf,erf.(x_erf))
end

# ╔═╡ 19cd3260-3f82-11eb-06df-91b1fd0eb317
erf.(x_erf)

# ╔═╡ Cell order:
# ╟─e30dd66e-3ef1-11eb-36b9-db59deb654cb
# ╟─1f0d3df0-3ef2-11eb-0d82-db20d6b63826
# ╠═86c1ec42-3ef3-11eb-3682-93ac7af389cd
# ╟─cf1ccd04-3ef3-11eb-364a-3f162a73a4bc
# ╠═a6050dd0-3ef3-11eb-2ce6-85b673092265
# ╠═aa267cac-3ef3-11eb-040e-1d562028f654
# ╠═c1ba56ae-3ef3-11eb-0ebd-c32f937b260d
# ╠═cd0890b6-3ef3-11eb-1b4c-6fb047b54d56
# ╠═0d2d3c46-3ef4-11eb-08d0-b9d61ca75879
# ╠═18225140-3ef4-11eb-0f65-d9ad413b34a7
# ╠═32b1efca-3ef4-11eb-0cab-6318111ce885
# ╟─633e91de-3ef4-11eb-2c88-9f4456ee3822
# ╠═4d7da29e-3ef5-11eb-1f7e-67a32e7c3c78
# ╠═a3b00286-3ef4-11eb-2f55-19be612622ea
# ╟─6ffbe812-3ef5-11eb-2c59-1349a122ef96
# ╠═fcdb5f52-3efe-11eb-3e2f-291fd5d982f1
# ╠═a85e4244-3f00-11eb-118f-57fcf4e28eb4
# ╠═eebb9894-3ef7-11eb-3da9-694cf72594a7
# ╠═5f0af042-3f00-11eb-0a00-f585980ab677
# ╠═7ef55596-3f00-11eb-25f7-3fda92d5a701
# ╟─c2c676b0-3f00-11eb-009c-371ee10fccd6
# ╠═da88ce1a-3f00-11eb-1b50-e9c911898fe4
# ╠═e269f9d4-3f0e-11eb-19d8-f9af9adc75e1
# ╠═f3c6a2ac-3f0e-11eb-0f35-3d736b676edc
# ╟─759484f4-3f0f-11eb-2cb6-09d2b8a5f865
# ╠═00e6302a-3f10-11eb-3287-159b670c5e35
# ╠═0bd7e640-3f10-11eb-09f2-978360227cd9
# ╠═14968282-3f10-11eb-3ab7-2b0e63cc0fd3
# ╟─57d6ec56-3f10-11eb-3f38-0bac7dc0819f
# ╟─01125882-3f13-11eb-36e0-43a60b0ec7f3
# ╠═e04247d2-3f14-11eb-2ccf-4b154d5987e9
# ╠═74c9594e-3f7a-11eb-032c-bf4054554020
# ╠═11d190c0-3f13-11eb-1f63-abdf232e6e38
# ╠═374d3686-3f15-11eb-28b5-e16429a396f8
# ╠═e4ec5864-3f13-11eb-36e0-1bca46758bff
# ╟─9ca79134-3f18-11eb-0f93-75ffd7d1f48f
# ╠═5c181efa-3f19-11eb-327a-89243bdd57b8
# ╠═89b5256a-3f19-11eb-2e65-9bcb02277f04
# ╟─83ecadc0-3f18-11eb-1f9e-d531ae5a2ffd
# ╟─55291d9e-3f7b-11eb-3ecf-83ab6a0566f4
# ╟─595b4912-3f7d-11eb-1d17-1bc18638dedd
# ╠═dfa68c64-3f7f-11eb-0aff-eb852a23e8c3
# ╠═31c728d2-3f80-11eb-0939-dd10102bc8c0
# ╠═96a47700-3f80-11eb-06ff-bdb8910d2a4e
# ╠═6101efbe-3f81-11eb-0285-03c1558e9cb9
# ╠═d6ad4dde-3f82-11eb-160b-4f7240c195ac
# ╠═a30c8780-3f80-11eb-1027-e7bbf31fd9e7
# ╠═f0600620-3f82-11eb-012f-379c6ba075e1
# ╠═e0d1045a-3f81-11eb-20d1-07eb1571785d
# ╠═19cd3260-3f82-11eb-06df-91b1fd0eb317
