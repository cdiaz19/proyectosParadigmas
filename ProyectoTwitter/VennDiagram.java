import static com.googlecode.charts4j.collect.Preconditions.checkArgument;
import static com.googlecode.charts4j.collect.Preconditions.checkNotNull;

import java.util.List;

import com.googlecode.charts4j.collect.ImmutableList;
import com.googlecode.charts4j.collect.Lists;
import com.googlecode.charts4j.parameters.ChartType;


public class VennDiagram extends AbstractGraphChart {

    /** First Venn diagram circle. **/
    private Color          circle1Color;

    /** Second Venn diagram circle. **/
    private Color          circle2Color;

    /** Third Venn diagram circle. **/
    private Color          circle3Color;

    /** First Venn diagram circle legend. **/
    private String         circle1Legend;

    /** Second Venn diagram circle legend. **/
    private String         circle2Legend;

    /** Third Venn diagram circle legend. **/
    private String         circle3Legend;

    /** Data array that will hold the circle sizes. **/
    private final double[] data;

    /**
     * @see GCharts#newVennDiagram(double, double, double, double, double,
     *      double, double)
     */
    VennDiagram(final double circle1Size, final double circle2Size, final double circle3Size, final double abIntersect, 
      final double caIntersect, final double bcIntersect, final double abcIntersect) {
        super();
        final double[] data = {circle1Size, circle2Size, circle3Size, abIntersect, caIntersect, bcIntersect, abcIntersect};
        for (double d : data) {
            checkArgument(d >= Data.MIN_VALUE && d <= Data.MAX_VALUE, "Venn diagram values must be between 0 and 100: %s", d);
        }
        this.data = data;
    }

    /**
     * Set the colors of the circles.
     *
     * @param circle1Color
     *            color of circle 1. Cannot be null.
     * @param circle2Color
     *            color of circle 2. Cannot be null.
     * @param circle3Color
     *            color of circle 3. Cannot be null.
     * @see Color
     */
    public final void setCircleColors(final Color circle1Color, final Color circle2Color, final Color circle3Color) {
        checkNotNull(circle1Color);
        checkNotNull(circle2Color);
        checkNotNull(circle3Color);
        this.circle1Color = circle1Color;
        this.circle2Color = circle2Color;
        this.circle3Color = circle3Color;
    }

    /**
     * Set the legends of the circles.
     *
     * @param circle1Legend
     *            legend of circle 1. Cannot be null.
     * @param circle2Legend
     *            legend of circle 2. Cannot be null.
     * @param circle3Legend
     *            legend of circle 3. Cannot be null.
     */
    public final void setCircleLegends(final String circle1Legend, final String circle2Legend, final String circle3Legend) {
        checkNotNull(circle1Legend);
        checkNotNull(circle2Legend);
        checkNotNull(circle3Legend);
        this.circle1Legend = circle1Legend;
        this.circle2Legend = circle2Legend;
        this.circle3Legend = circle3Legend;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    protected void prepareData() {
        super.prepareData();
        if (circle1Color != null && circle2Color != null && circle3Color != null) {

            final List<ImmutableList<Color>> colors = Lists.newArrayList();
            colors.add(Lists.of(circle1Color));
            colors.add(Lists.of(circle2Color));
            colors.add(Lists.of(circle3Color));
            parameterManager.addColors(Lists.copyOf(colors));
        }
        if (circle1Legend != null && circle2Legend != null && circle3Legend != null) {
            parameterManager.addLegends(Lists.of(circle1Legend, circle2Legend, circle3Legend));
        }
        parameterManager.setChartTypeParameter(ChartType.VENN_DIAGRAM);
        parameterManager.addData(Data.newData(data));
    }
}

}
