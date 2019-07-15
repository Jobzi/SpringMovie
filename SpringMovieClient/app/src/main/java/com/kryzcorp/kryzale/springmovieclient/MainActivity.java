package com.kryzcorp.kryzale.springmovieclient;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.SoapFault;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;
import java.util.Vector;
import java.util.jar.Attributes;

public class MainActivity extends AppCompatActivity {
    private EditText etCedula;
    private TextView txtResultado;
    private Button btnConsultar;
    String param1,mensaje;
    SoapPrimitive resultString;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etCedula = findViewById(R.id.etNombre);
        txtResultado = findViewById(R.id.et_Resultado);
        btnConsultar = findViewById(R.id.btnConsultar);

        btnConsultar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                param1 = etCedula.getText().toString();
                new SegundoPlano().execute(etCedula.getText().toString().trim());

            }
        });
    }

    private void convertir(){
        String SOAP_ACTION = "";
        String METHOD_NAME = "BuscarAlquiler";
        String NAMESPACE = "http://WebService/";
        String URL = "http://localhost:8080/MovieSpringH/AlquilerWS";

        try {
            SoapObject Request = new SoapObject(NAMESPACE,METHOD_NAME);
            Request.addProperty("cedula",param1);
            SoapSerializationEnvelope soapEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            soapEnvelope.dotNet = true;
            soapEnvelope.setOutputSoapObject(Request);

            HttpTransportSE transport = new HttpTransportSE(URL);
            transport.call(SOAP_ACTION,soapEnvelope);
            resultString = (SoapPrimitive) soapEnvelope.getResponse();
            mensaje = "OK";

        } catch (Exception ex){
            mensaje = "Error:"+ex.getMessage();
        }
    }

    private class SegundoPlano extends AsyncTask<String,String,String>{
        static final String NAMESPACE="http://WebService/";
        static final String METHODNAME="BuscarAlquiler";
        static final String URL="http://10.52.50.152:8080/MovieSpringH/AlquilerWS?WSDL";
        static final String SOAP_ACTION=NAMESPACE+METHODNAME;

        @Override
        protected String doInBackground(String... strings) {
            String resultado="";
            SoapObject request = new SoapObject(NAMESPACE,METHODNAME);
            request.addProperty("cedula",param1);
            SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
            envelope.dotNet=false;
            envelope.setOutputSoapObject(request);
            HttpTransportSE transporte = new HttpTransportSE(URL);
            Log.d("transporte",request.toString());
            try {

                transporte.call(SOAP_ACTION,envelope);
                //SoapObject response = (SoapObject) envelope.getResponse();
                SoapPrimitive response = (SoapPrimitive) envelope.getResponse();
                resultado = response.toString();
                Log.d("reps",response.toString());
                //Vector<?> responseVector = (Vector<?>) response.getProperty(0);
                //int count =responseVector.size();
                //Log.d("vectorResponse",String.valueOf(count));
            }catch (Exception e){
                Log.d("eXXX",e.toString());
                resultado = e.getMessage();
            }
            return resultado;
        }

        @Override
        protected void onPostExecute(String s){
            super.onPostExecute(s);
            txtResultado.setText(s);
        }

    }


}
