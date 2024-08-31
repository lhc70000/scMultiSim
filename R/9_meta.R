.ver <- "1.0.0"

#' Show detailed documentations of scMultiSim's parameters
#'
#' @param topic Can be `options`, `dynamic.GRN`, or `cci`
#' @return none
#' @export
#'
#' @examples scmultisim_help()
scmultisim_help <- function(topic = NULL) {
  if (is.null(topic)) {
    meta_help <- "Call scmultisim_help(topic) where topic can be \"options\" or an option name. Printing help for options by default.\n"
    sprintf(.split_long_string(meta_help)) %>% cat()
    topic <- "options"
  }
  
  if (topic == "options") {
    sprintf("scMultiSim  v%s\n", .ver) %>% cat()
    .print_opt()
    return()
  }
  
  if (topic == "dynamic.GRN") {
    .dynamic_grn_default_params(help = TRUE)
    return()
  }
  
  if (topic == "cci") {
    .cci_help()
    return()
  }
  
  .print_opt(topic)
}


.cci_help <- function() {
  cat("
To enable simulating cell-cell interaction, the value should be a list including
the following names:

- grid.size: (integer)
    Manually specify the width and height of the grid.
- layout: (character or function)
    Supported values are \"enhanced\",  \"layers\", \"islands\", or a custom function.
    If set to \"islands\", you can specify which cell types are the islands,
        e.g. \"islands:1,2\".
    The custom function should take two arguments: (grid_size, cell_types)
        grid_size: (integer)
            The width and height of the grid.
        cell_types: (integer vector)
            Each cell's cell type.
    It should return a n_cell x 2 matrix, where each row is the x and y coordinates of a cell.
- params: (data.frame)
    The spatial effect between neighbor cells.
    It should be a data frame similar to the GRN parameter.
- step.size: (number, optional)
    If using continuous population, use this step size to further divide the
    cell types on the tree. For example, if the tree only has one branch `a -> b`
    and the branch length is 1 while the step size is 0.34,
    there will be totally three cell types: a_b_1, a_b_2, a_b_3.
- cell.type.interaction: (\"random\" or a matrix)
    The interaction level between different cell types.
    They act as factors multiplied to the ligand effect.
    Supply the string \"random\" to let scMultiSim generate these factors randomly.
    Otherwise, use cci_cell_type_params() to generate the template data structure.
    See the help of this method for more info.
- cell.type.lr.pairs: (integer vector)
    If cell.type.interaction is \"random\", how many LR pairs should be enabled
    between each cell type pair.
    Should be a range, e.g. 4:6. The actual number of LR pairs will be uniformly
    sampled from this range.
- max.neighbors: (integer)
    Constraint the maxinum number of neighbors with CCI for each cell.
    The neighbors with CCI will be randomly sampled.
- radius: (number or string)
    Which cells should be considered as neighbors.
    The interacting cells are those within these neighbors.
    When it is a number, it controls the maximum distance between two cells for
    them to interact.
    When it is a string, it should be in the format `gaussian:sigma`, for example,
    `gaussian:1.2`.
    In this case, the probability of two cells interacting is proportional to
    the distance with a Gaussian kernel applied.
- start.layer: (integer)
    From which layer (time step) the simulation should start.
    If set to 1, the simulation will start with one cell in the grid and add one
    more cell in each following layer.
    If set to `num_cells`, the simulation will start from all cells available in
    the grid and only continues for a few static layers, which will greatly speed
    up the simulation.
      ")
}
