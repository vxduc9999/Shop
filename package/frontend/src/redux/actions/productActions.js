import * as actionTypes from "../constants/productConstants";
import axios from "../configAxios";


export const getProducts = () => async (dispatch) => {
  try {
    dispatch({ type: actionTypes.GET_PRODUCTS_REQUEST });
    const { data } = await axios.get("http://localhost:4000/");
    const actionPayload=data.map(e=>({
            _id:e.id,
            name:e.product_name,
            description:e.product_description,
            price:e.product_price,
            imageUrl:e.product_thumbnail,
            product_slug:e.product_slug
          }))
          dispatch({
            type: actionTypes.GET_PRODUCTS_SUCCESS,
            payload: actionPayload,
          });
    dispatch({
      type: actionTypes.GET_PRODUCTS_SUCCESS,
      payload: actionPayload,
    });
  } catch (error) {
    dispatch({
      type: actionTypes.GET_PRODUCTS_FAIL,
      payload:
        error.response && error.response.data.message
          ? error.response.data.message
          : error.message,
    });
  }
};

export const getProductDetails = (slug) => async (dispatch) => {
  try {
    dispatch({ type: actionTypes.GET_PRODUCT_DETAILS_REQUEST });
    const { data } = await axios.get(`detail/${slug}`);
    dispatch({
      type: actionTypes.GET_PRODUCT_DETAILS_SUCCESS,
      payload: data,
    });
  } catch (error) {
    dispatch({
      type: actionTypes.GET_PRODUCT_DETAILS_FAIL,
      payload:
        error.response && error.response.data.message
          ? error.response.data.message
          : error.message,
    });
  }
};

export const increase = (qty) => async (dispatch) => {
  try {
    dispatch({ type: actionTypes.GET_COUNTER_REQUEST });
    dispatch({
      type: actionTypes.GET_COUNTER_INCREASE,
      payload: qty + 1,
    });
  } catch (error) {
    dispatch({
      type: actionTypes.GET_COUNTER_FAIL,
      payload:
        error.response && error.response.data.message
          ? error.response.data.message
          : error.message,
    });
  }
};

export const decrease = (qty) => async (dispatch) => {
  try {
    dispatch({
      type: actionTypes.GET_COUNTER_INCREASE,
      payload: qty - 1,
    });
  } catch (error) {
    dispatch({
      type: actionTypes.GET_COUNTER_FAIL,
      payload:
        error.response && error.response.data.message
          ? error.response.data.message
          : error.message,
    });
  }
};
