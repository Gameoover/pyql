include '../../types.pxi'

from libcpp.vector cimport vector

from quantlib.termstructures._yield_term_structure cimport YieldTermStructure

from quantlib.time._date cimport Date
from quantlib.time._daycounter cimport DayCounter
from quantlib.time._calendar cimport Calendar


cdef extern from 'ql/math/interpolations/all.hpp' namespace 'QuantLib':
    cdef cppclass Linear:
        pass

    cdef cppclass LogLinear:
        pass

    cdef cppclass BackwardFlat:
        pass

cdef extern from 'ql/termstructures/yield/discountcurve.hpp' namespace 'QuantLib':

    cdef cppclass InterpolatedDiscountCurve[T](YieldTermStructure):
        InterpolatedDiscountCurve(const vector[Date]& dates,
                                  const vector[DiscountFactor]& dfs,
                                  const DayCounter& dayCounter,
                                  const Calendar& cal # = Calendar()
        ) except +
        const vector[Time]& times()
        const vector[Real]& data()
        const vector[DiscountFactor]& discounts()
        const vector[Date]& dates()

    ctypedef InterpolatedDiscountCurve[LogLinear] DiscountCurve
