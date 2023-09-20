<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- FLOT CHARTS -->
<script src="../../plugins/flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="../../plugins/flot/plugins/jquery.flot.resize.js"></script>
<script type="text/javascript">
/*
 * BAR CHART
 * ---------
 */

var bar_data = {
  data : [[1,10], [2,8], [3,4], [4,13], [5,17], [6,9]],
  bars: { show: true }
}
$.plot('#bar-chart', [bar_data], {
  grid  : {
    borderWidth: 1,
    borderColor: '#f3f3f3',
    tickColor  : '#f3f3f3'
  },
  series: {
     bars: {
      show: true, barWidth: 0.5, align: 'center',
    },
  },
  colors: ['#3c8dbc'],
  xaxis : {
    ticks: [[1,'January'], [2,'February'], [3,'March'], [4,'April'], [5,'May'], [6,'June']]
  }
})
/* END BAR CHART */
</script>
</head>
<body>
	<!-- Bar chart -->
	<div class="card card-primary card-outline">
		<div class="card-header">
			<h3 class="card-title">
				<i class="far fa-chart-bar"></i> Bar Chart
			</h3>

			<div class="card-tools">
				<button type="button" class="btn btn-tool" data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<div class="card-body">
			<div id="bar-chart" style="height: 300px;"></div>
		</div>
		<!-- /.card-body-->
	</div>
	<!-- /.card -->

</body>
</html>