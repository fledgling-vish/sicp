;;; if i1 has width w1 & i2 has width w2
;;; then
;;; (add-interval i1 i2) will have a width of w1 + w2
;;; (sub-interval i1 i2) will have a width of w1 + w2
;;; (mult-interval i1 i2) & (div-interval i1 i2) width won't be a function of w1 & w2. The width will rather depend on the values of upper & lower bounds of intervals. Below I will show that we will get different width for mult-interval when we use same width intervals with different upper & lower bounds.
;;; example: let's say i1 is [2 12], i2 is [4 8], w1 is 5 & w2 is 2. the width of interval resulted by mult-interval will be 44
;;; now let's assume i1 is [5 15], i2 is [7, 11]. The w1 & w2 are same as above. The width of interval resulted by mult-interval will be 65


