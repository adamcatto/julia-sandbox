"""
Julia implementation of the `sparse arrays` problem from HackerRank.
https://www.hackerrank.com/challenges/sparse-arrays/problem

Parameters:
strings: 1d array of strings
queries: 1d array of strings

Return: 1d array of integers representing counter of regex matches per query
"""
function matchingstrings(strings::Array{String, 1}, queries::Array{String, 1})
    d = Dict()
    for s in queries
        d[s] = 0
    end
    for s in strings
        for q in queries
            q_ = Regex(q)
            if match(q_, s) !== nothing
                d[q] += 1
                println(q, s, match(q_, s))
            end
        end
    end
    return values(d)
end

matchingstrings(["abc", "defg", "abcxyzg"], ["abc", "def", "xyz"]) # 2, 2, 1