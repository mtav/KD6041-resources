function gap_infos = MPB_getGaps(data)
  % This function will return a structure "gap_infos" with information about the bandgaps.
  % "data" should be as returned by data = MPB_load_data('example.dat').
  
  gap_infos = struct();
  
  % get min/max values in each column (along dimension 1)
  gap_infos.minima = min(data.fn, [], 1);
  gap_infos.maxima = max(data.fn, [], 1);
  
  % all gap values, even if negative
  gap_infos.gaps.top = gap_infos.minima(2:end);
  gap_infos.gaps.bottom = gap_infos.maxima(1:end-1);
  gap_infos.gaps.size_absolute = gap_infos.gaps.top - gap_infos.gaps.bottom;
  gap_infos.gaps.midgap = 0.5*(gap_infos.gaps.top + gap_infos.gaps.bottom);
  gap_infos.gaps.size_relative = gap_infos.gaps.size_absolute./gap_infos.gaps.midgap;
  
  % extract positive gaps (i.e. full gaps)
  
  % get indices
  gap_infos.fullgaps.bottom_band_idx = find(gap_infos.gaps.size_absolute > 0);
  
  % extract based on found indices
  gap_infos.fullgaps.top = gap_infos.gaps.top(gap_infos.fullgaps.bottom_band_idx);
  gap_infos.fullgaps.bottom = gap_infos.gaps.bottom(gap_infos.fullgaps.bottom_band_idx);
  gap_infos.fullgaps.size_absolute = gap_infos.gaps.size_absolute(gap_infos.fullgaps.bottom_band_idx);
  gap_infos.fullgaps.midgap = gap_infos.gaps.midgap(gap_infos.fullgaps.bottom_band_idx);
  gap_infos.fullgaps.size_relative = gap_infos.gaps.size_relative(gap_infos.fullgaps.bottom_band_idx);
end
