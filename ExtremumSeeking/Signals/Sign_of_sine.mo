within ExtremumSeeking.Signals;
model Sign_of_sine
  import Modelica.Constants.pi;
  parameter Real peak_amplitude = 1;
  parameter Modelica.SIunits.Frequency frequency = 1;
  parameter Modelica.SIunits.Angle phase_shift(displayUnit="rad") = 0;
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

protected
  Real sine;
  Modelica.SIunits.Time T_start "Start time of current period";
  Integer count "Period count";

equation

  sine = Modelica.Math.sin(2*pi*frequency*time + phase_shift);

  when integer(time*frequency + phase_shift/(2*pi)) > pre(count) then
    count = pre(count) + 1;
    T_start = time;
  end when;
  y = if time < T_start + 1/(2*frequency) then peak_amplitude else -peak_amplitude;

  annotation (experiment(StopTime=10));
end Sign_of_sine;
