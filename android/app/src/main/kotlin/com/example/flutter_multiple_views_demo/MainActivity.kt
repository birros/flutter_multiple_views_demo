package com.example.flutter_multiple_views_demo

import android.graphics.Color
import android.os.Bundle
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment

class MainActivity: AppCompatActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    // set status bar color to blue to match first flutter view
    window.statusBarColor = Color.parseColor("#2196f3")

    // layout
    val layout = LinearLayout(this)
    layout.setId(1)
    layout.setLayoutParams(
      LinearLayout.LayoutParams(
        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT
      )
    )
    layout.setOrientation(LinearLayout.VERTICAL)
    setContentView(layout)

    // layout1
    val layout1 = LinearLayout(this)
    layout1.setId(2)
    layout1.setLayoutParams(
      LinearLayout.LayoutParams(
        ViewGroup.LayoutParams.FILL_PARENT,
        0
      ).apply {
        weight = 1.0f
      }
    )
    layout.addView(layout1)

    // layout2
    val layout2 = LinearLayout(this)
    layout2.setId(3)
    layout2.setLayoutParams(
      LinearLayout.LayoutParams(
        ViewGroup.LayoutParams.FILL_PARENT,
        0
      ).apply {
        weight = 1.0f
      }
    )
    layout.addView(layout2)

    val flutterFragment = FlutterFragment.createDefault()
    val flutterFragment2 = FlutterFragment
      .withNewEngine()
      .dartEntrypoint("myOtherEntrypoint")
      .build() as FlutterFragment

    supportFragmentManager
      .beginTransaction()
      .add(
        layout1.getId(),
        flutterFragment,
        "flutter_fragment_1"
      )
      .add(
        layout2.getId(),
        flutterFragment2,
        "flutter_fragment_2"
      )
      .commit()
  }
}
