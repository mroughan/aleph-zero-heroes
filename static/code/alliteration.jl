using StatsBase # for 'countmap'
using Languages # for stop words

function alliterate(s::AbstractString)
    s = replace( s, r"\(.*\)" => "" )
    words = split( s, r"[\s-]+" )
    i = 1
    sw = Set(stopwords(Languages.English()))
    while i <= length(words)
        if in(words[i], sw)
            deleteat!(words, i) 
        end
        i += 1
    end
    initials = [ words[i][1] for i in findall(length.(words) .> 0) ]
    f_n = length(initials)
    if f_n <= 1
        return (false, f_n, f_n, ' ')
    end
    d = countmap(initials)
    mx = findmax(d) # mx[1] is the freq. of the most common letter, and mx[2] the letter
    if f_n == 2 && mx[1] == 2 
        result = true
    elseif f_n == 3 && mx[1] >= 2
        result = true
    elseif f_n == 4 && mx[1] >= 3
        result = true
    else
        result = false
    end
    return (result, f_n, mx[1], mx[2])
end
