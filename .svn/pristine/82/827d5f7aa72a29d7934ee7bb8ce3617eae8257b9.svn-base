package com.amazingReader.entity.utilEntity;

public class PlatformIncome {
    private int thisYear;
    private int thisMonth;
    private double totalIncome;

    public PlatformIncome() {
    }

    public PlatformIncome(int thisYear, int thisMonth, double totalIncome) {
        this.thisYear = thisYear;
        this.thisMonth = thisMonth;
        this.totalIncome = totalIncome;
    }

    public int getThisYear() {
        return thisYear;
    }

    public void setThisYear(int thisYear) {
        this.thisYear = thisYear;
    }

    public int getThisMonth() {
        return thisMonth;
    }

    public void setThisMonth(int thisMonth) {
        this.thisMonth = thisMonth;
    }

    public double getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(double totalIncome) {
        this.totalIncome = totalIncome;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PlatformIncome that = (PlatformIncome) o;

        if (thisYear != that.thisYear) return false;
        if (thisMonth != that.thisMonth) return false;
        return Double.compare(that.totalIncome, totalIncome) == 0;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = thisYear;
        result = 31 * result + thisMonth;
        temp = Double.doubleToLongBits(totalIncome);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
