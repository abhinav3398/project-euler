const _num2lenOword = Dict(0 => 0, 1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4, 10 => 3, 11 => 6, 12 => 6, 13 => 8, 14 => 8, 15 => 7, 16 => 7, 17 => 9, 18 => 8, 19 => 8, 20 => 6, 30 => 6, 40 => 5, 50 => 5, 60 => 5, 70 => 7, 80 => 6, 90 => 6)

num(d::Vector{T}; d_len::T = length(d)) where T <: Integer = sum([d[k]*10^(k-1) for k=1:d_len])

function get_num_len(n::Integer; is_child::Bool=false)
    nums = digits(n)[end:-1:1]
    len_digits = length(nums)
    
    if len_digits <= 2
        haskey(_num2lenOword, n) && return _num2lenOword[n] + ((is_child && _num2lenOword[n] != 0) ? 3 : 0)

        return _num2lenOword[nums[1]*10] + _num2lenOword[nums[2]] + (is_child ? 3 : 0)
    elseif 2 < len_digits <= 5
        # ? thousand'th : million'th or hundred'th
        sub_script = (len_digits == 4) ? 8 : 7
        len_O_word_of_1st_dig = _num2lenOword[first(nums)] + sub_script
        len_O_word_of_ramaining_digs = get_num_len(num(nums[end:-1:2], d_len=len_digits-1), is_child=true)

        return len_O_word_of_1st_dig + len_O_word_of_ramaining_digs
    end

    -1
end

number_letter_counts(n) = sum(get_num_len, 1:n)